return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        cond = not vim.g.vscode,
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = { long_message_to_split = true },
        },
    },

    {
        "nvim-lualine/lualine.nvim",
        cond = not vim.g.vscode,
        event = "UIEnter",
        config = function()
            local mode_map = {
                n = "(ᴗ_ ᴗ。)",
                nt = "(ᴗ_ ᴗ。)",
                i = "(•̀ - •́ )",
                R = "( •̯́ ₃ •̯̀)",
                v = "(⊙ _ ⊙ )",
                V = "(⊙ _ ⊙ )",
                no = "Σ(°△°ꪱꪱꪱ)",
                ["\22"] = "(⊙ _ ⊙ )",
                t = "(⌐■_■)",
                ["!"] = "Σ(°△°ꪱꪱꪱ)",
                c = "Σ(°△°ꪱꪱꪱ)",
                s = "SUB",
            }

            require("lualine").setup({
                options = {
                    icons_enabled = true,
                    theme = "catppuccin",
                    section_separators = { left = "", right = "" },
                    component_separators = { left = "", right = "" },
                    globalstatus = true,
                },
                sections = {
                    lualine_a = {
                        {
                            function()
                                return ""
                            end,
                            separator = "",
                        },
                        {
                            "mode",
                            padding = { left = 0, right = 1 },
                        },
                    },
                    lualine_b = { "branch", "diff" },
                    lualine_c = { "filename", "filesize" },
                    lualine_x = {
                        {
                            require("noice").api.status.mode.get,
                            cond = require("noice").api.status.mode.has,
                            color = { fg = vim.g.palette.overlay0 },
                        },
                        "%S",
                        "%l:%c",
                        {
                            "filetype",
                            colored = true,
                        },
                    },
                    lualine_y = {
                        {
                            "encoding",
                            padding = { left = 1, right = 0 },
                        },
                        "fileformat",
                    },
                    lualine_z = {
                        {
                            "diagnostics",
                            sources = { "nvim_diagnostic" },
                            symbols = { error = " ", warn = " ", info = " " },
                            diagnostics_color = {
                                error = { bg = vim.g.palette.base, fg = vim.g.palette.red },
                                warn = { bg = vim.g.palette.base, fg = vim.g.palette.peach },
                                info = { bg = vim.g.palette.base, fg = vim.g.palette.yellow },
                                hint = { bg = vim.g.palette.base, fg = vim.g.palette.sky },
                            },
                        },
                    },
                },
                tabline = {
                    lualine_a = {
                        {
                            "buffers",
                            buffers_color = {
                                inactive = {
                                    bg = vim.g.palette.surface0,
                                    fg = vim.g.palette.text,
                                },
                            },
                            padding = 1,
                            filetype_names = {
                                Avante = " Avante Chat",
                                AvanteInput = " Avante Chat",
                                NeogitStatus = " Neogit",
                                OverseerList = " Overseer",
                                checkhealth = " Health Check",
                                dashboard = "󰕮 Dashboard",
                                dbui = " DadBod",
                                lazy = "󰒲 Lazy",
                                lspinfo = " LSP Info",
                                mason = "󰇚 Mason",
                                oil = "󰏇 Oil",
                                undotree = " UndoTree",
                            },
                        },
                    },
                    lualine_y = {
                        {
                            function()
                                return mode_map[vim.api.nvim_get_mode().mode] or [[光速]]
                            end,
                            separator = { left = "", right = "" },
                            padding = 0,
                        },
                    },
                },
                extensions = { "nvim-dap-ui", "quickfix" },
            })
        end,
    },
}
