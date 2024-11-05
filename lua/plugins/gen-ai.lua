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
        "yetone/avante.nvim",
        build = "make",
        cmd = {
            "AvanteChat",
            "AvanteAsk",
            "AvanteRefresh",
            "AvanteFocus",
            "AvanteEdit",
            "AvanteClear",
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
            require("avante").setup({
                provider = "ollama",
                vendors = {
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
                    input = {
                        prefix = "❯ ",
                    },
                },
            })
        end,
    },
}
