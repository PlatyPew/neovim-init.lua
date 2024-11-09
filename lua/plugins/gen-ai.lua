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
            ignore_filetypes = { "AvanteInput" },
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
            "AvanteSwitchProvider",
            "AvanteToggle",
        },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
            "HakonHarnes/img-clip.nvim",
            "MeanderingProgrammer/render-markdown.nvim",
        },
        keys = {
            {
                "<Leader>aa",
                function()
                    require("avante.api").ask()
                end,
                desc = "Ask",
                mode = { "n", "v" },
            },
            {
                "<Leader>ac",
                "<Cmd>AvanteChat<CR>",
                desc = "Chat",
                mode = { "n", "v" },
            },
            {
                "<Leader>ae",
                function()
                    require("avante.api").edit()
                end,
                desc = "Edit",
                mode = { "n", "v" },
            },
            {
                "<Leader>ar",
                function()
                    require("avante.api").refresh()
                end,
                desc = "Refresh",
            },
            {
                "<Leader>ap",
                function()
                    return vim.bo.filetype == "AvanteInput"
                            and require("avante.clipboard").paste_image()
                        or require("img-clip").paste_image()
                end,
                desc = "Paste Image",
            },
        },
        config = function()
            if vim.fn.has("macunix") == 1 then
                -- security add-generic-password -a "GitHub Token" -s "GITHUB_TOKEN" -w "<api_key>"
                vim.env.GITHUB_TOKEN = vim.fn
                    .system("security find-generic-password -s GITHUB_TOKEN -w")
                    :gsub("[\n\r]", "")
                vim.env.GEMINI_API_KEY = vim.fn
                    .system("security find-generic-password -s GEMINI_API_KEY -w")
                    :gsub("[\n\r]", "")
            end
            require("avante").setup({
                provider = "github",
                gemini = {
                    -- model = "gemini-1.5-flash-latest", -- Base model
                    model = "gemini-1.5-pro-exp-0827", -- Experimental model
                },
                vendors = {
                    github = {
                        ["local"] = true,
                        endpoint = "https://models.inference.ai.azure.com",
                        model = "gpt-4o",
                        -- model = "gpt-4o-mini", -- Smaller model for rate limit
                        api_key = vim.env.GITHUB_TOKEN,
                        parse_curl_args = function(opts, code_opts)
                            return {
                                url = opts.endpoint .. "/chat/completions",
                                headers = {
                                    ["Content-Type"] = "application/json",
                                    ["Authorization"] = "Bearer " .. opts.api_key,
                                },
                                body = {
                                    model = opts.model,
                                    messages = require("avante.providers").copilot.parse_messages(
                                        code_opts
                                    ),
                                    temperature = 0,
                                    max_tokens = 4000,
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
                    },
                    ollama = {
                        ["local"] = true,
                        endpoint = "127.0.0.1:11434/v1",
                        model = "codegemma:instruct",
                        parse_curl_args = function(opts, code_opts)
                            return {
                                url = opts.endpoint .. "/chat/completions",
                                headers = {
                                    ["Accept"] = "application/json",
                                    ["Content-Type"] = "application/json",
                                },
                                body = {
                                    model = opts.model,
                                    messages = require("avante.providers").copilot.parse_messages(
                                        code_opts
                                    ),
                                    temperature = 0,
                                    max_tokens = 4096,
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
                    },
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
