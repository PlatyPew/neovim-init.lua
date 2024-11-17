return {
    {
        "Exafunction/codeium.nvim",
        event = "InsertEnter",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        opts = { enable_chat = true },
    },

    {
        "supermaven-inc/supermaven-nvim",
        build = function()
            local api = require("supermaven-nvim.api")
            api.start()
            api.use_free_version()
        end,
        event = "InsertEnter",
        opts = {
            ignore_filetypes = { "AvanteInput", "oil" },
            log_level = "off",
            keymaps = {
                accept_suggestion = "<M-CR>",
                clear_suggestion = "<M-]>",
                accept_word = "<M-w>",
            },
        },
    },

    {
        "yetone/avante.nvim",
        build = "make",
        cmd = {
            "AvanteChat",
            "AvanteAsk",
            "AvanteEdit",
            "AvanteToggle",
            "AvanteSwitchProvider",
        },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
            "HakonHarnes/img-clip.nvim",
        },
        -- stylua: ignore
        keys = {
            { "<Leader>aa", function() require("avante.api").ask() end, desc = "Ask", mode = { "n", "v" } },
            { "<Leader>ac", "<Cmd>AvanteChat<CR>", desc = "Chat", mode = { "n", "v" }, },
            { "<Leader>ae", function() require("avante.api").edit() end, desc = "Edit", mode = { "n", "v" } },
            { "<Leader>ar", function() require("avante.api").refresh() end, desc = "Refresh" },
            { "<Leader>ap", function() return vim.bo.filetype == "AvanteInput" and require("avante.clipboard").paste_image() or require("img-clip").paste_image() end, desc = "Paste Image" },
            { "<Leader>as", function() _G.Avante_select_model() end, desc = "Select Model" },
        },
        lazy = true,
        config = function()
            if vim.fn.has("macunix") == 1 then
                -- security add-generic-password -a "GitHub Token" -s "GITHUB_TOKEN" -w "<api_key>"
                vim.env.GITHUB_TOKEN = vim.fn
                    .system({ "security", "find-generic-password", "-s", "GITHUB_TOKEN", "-w" })
                    :gsub("[\n\r]", "")
                vim.env.GEMINI_API_KEY = vim.fn
                    .system({ "security", "find-generic-password", "-s", "GEMINI_API_KEY", "-w" })
                    :gsub("[\n\r]", "")
            else
                -- echo "<api_key>" > ~/.apikeys/github_token && chmod 600 ~/.apikeys/github_token
                local github_token_path = vim.fn.expand("$HOME/.apikeys/github_token")
                local gemini_api_key_path = vim.fn.expand("$HOME/.apikeys/gemini_api_key")

                if vim.fn.filereadable(github_token_path) == 1 then
                    vim.env.GITHUB_TOKEN = vim.fn.readfile(github_token_path)[1]:gsub("[\n\r]", "")
                end

                if vim.fn.filereadable(gemini_api_key_path) == 1 then
                    vim.env.GEMINI_API_KEY =
                        vim.fn.readfile(gemini_api_key_path)[1]:gsub("[\n\r]", "")
                end
            end
            local generate_vendor_config = function(
                endpoint,
                model,
                api_key,
                max_tokens,
                temperature
            )
                return {
                    ["local"] = true,
                    endpoint = endpoint,
                    model = model,
                    api_key = api_key,
                    parse_curl_args = function(opts, code_opts)
                        return {
                            url = opts.endpoint .. "/chat/completions",
                            headers = {
                                ["Content-Type"] = "application/json",
                                ["Authorization"] = api_key and ("Bearer " .. api_key) or nil,
                            },
                            body = {
                                model = opts.model,
                                messages = require("avante.providers").copilot.parse_messages(
                                    code_opts
                                ),
                                temperature = temperature,
                                max_tokens = max_tokens,
                                stream = true,
                            },
                        }
                    end,
                    parse_response_data = function(data_stream, event_state, opts)
                        require("avante.providers").openai.parse_response(
                            data_stream,
                            event_state,
                            opts
                        )
                    end,
                }
            end
            -- stylua: ignore
            local vendors_3rd_party = {
                gpt_4o = generate_vendor_config("https://models.inference.ai.azure.com", "gpt-4o", vim.env.GITHUB_TOKEN, 4096, 0),
                gpt_4o_mini = generate_vendor_config( "https://models.inference.ai.azure.com", "gpt-4o-mini", vim.env.GITHUB_TOKEN, 4096, 0),
                codeqwen = generate_vendor_config("127.0.0.1:11434/v1", "qwen2.5-coder:7b", nil, 4096, 0),
            }
            require("avante").setup({
                provider = "gpt_4o",
                gemini = {
                    -- model = "gemini-1.5-flash-latest", -- Base model
                    model = "gemini-exp-1114", -- Experimental model
                },
                vendors = {
                    gpt_4o = vendors_3rd_party.gpt_4o,
                    gpt_4o_mini = vendors_3rd_party.gpt_4o_mini,
                    codeqwen = vendors_3rd_party.codeqwen,
                },
                behaviour = {
                    auto_set_keymaps = false,
                    support_paste_from_clipboard = true,
                },
                hints = { enabled = false },
                windows = {
                    width = 40,
                    input = {
                        prefix = "❯ ",
                    },
                },
            })
        end,
    },
}
