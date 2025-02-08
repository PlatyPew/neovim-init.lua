return {
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
            local load_api_key = function(api_name)
                if vim.fn.has("macunix") == 1 then
                    -- security add-generic-password -a "GitHub Token" -s "GITHUB_TOKEN" -w "<api_key>"
                    vim.env[api_name] = vim.fn
                        .system({ "security", "find-generic-password", "-s", api_name, "-w" })
                        :gsub("[\n\r]", "")
                else
                    -- echo "<api_key>" > ~/.apikeys/GITHUB_TOKEN && chmod 600 ~/.apikeys/GITHUB_TOKEN
                    local api_key_path = vim.fn.expand("$HOME/.apikeys/" .. api_name)
                    if vim.fn.filereadable(api_key_path) == 1 then
                        vim.env[api_name] = vim.fn.readfile(api_key_path)[1]:gsub("[\n\r]", "")
                    end
                end
            end

            local api_names = {
                "GITHUB_TOKEN",
                "GEMINI_API_KEY",
                "CODESTRAL_API_KEY",
                "MISTRAL_API_KEY",
                "GLHF_API_KEY",
            }
            for _, api_name in ipairs(api_names) do
                if vim.env[api_name] == nil then
                    load_api_key(api_name)
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
                    api_key_name = '',
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
                deepseek_8b = generate_vendor_config("127.0.0.1:11434/v1", "deepseek-r1:8b", nil, 4096, 0),
                codestral = generate_vendor_config("https://codestral.mistral.ai/v1", "codestral-latest", vim.env.CODESTRAL_API_KEY, 4096, 0),
                mistral_large = generate_vendor_config("https://api.mistral.ai/v1/", "mistral-large-latest", vim.env.MISTRAL_API_KEY, 4096, 0),
                llama3_405b = generate_vendor_config("https://glhf.chat/api/openai/v1", "hf:meta-llama/Meta-Llama-3.1-405B-Instruct", vim.env.GLHF_API_KEY, 4096, 0),
                qwen_coder_32b = generate_vendor_config("https://glhf.chat/api/openai/v1", "hf:Qwen/Qwen2.5-Coder-32B-Instruct", vim.env.GLHF_API_KEY, 4096, 0),
            }
            require("avante").setup({
                provider = "gpt_4o",
                gemini = {
                    -- model = "gemini-1.5-flash-latest", -- Base model
                    model = "gemini-exp-1206", -- Experimental model
                },
                vendors = {
                    gpt_4o = vendors_3rd_party.gpt_4o,
                    gpt_4o_mini = vendors_3rd_party.gpt_4o_mini,
                    deepseek_8b = vendors_3rd_party.deepseek_8b,
                    codestral = vendors_3rd_party.codestral,
                    mistral_large = vendors_3rd_party.mistral_large,
                    llama3_405b = vendors_3rd_party.llama3_405b,
                    qwen_coder_32b = vendors_3rd_party.qwen_coder_32b,
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
