return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
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
        dependencies = {
            "MunifTanjim/nui.nvim",
            { "stevearc/dressing.nvim", opts = {} },
        },
    },

    {
        "nvim-lualine/lualine.nvim",
        event = "UIEnter",
        dependencies = {
            "folke/noice.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("lualine").setup({
                options = {
                    icons_enabled = true,
                    theme = "catppuccin",
                    section_separators = { left = "", right = "" },
                    component_separators = { left = "", right = "" },
                    globalstatus = true,
                },
                sections = {
                    lualine_a = { "mode" },
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
                                NeogitStatus = " Neogit",
                                OverseerList = " Overseer",
                                ["copilot-chat"] = " Copilot Chat",
                                checkhealth = " Health Check",
                                dashboard = "󰕮 Dashboard",
                                dbui = " DadBod",
                                harpoon = "󱡅 Harpoon",
                                lazy = "󰒲 Lazy",
                                lspinfo = " LSP Info",
                                mason = "󰇚 Mason",
                                oil = "󰏇 Oil",
                                undotree = " UndoTree",
                            },
                        },
                    },
                    lualine_y = {
                        function()
                            return [[光速]]
                        end,
                    },
                },
                extensions = { "nvim-dap-ui", "quickfix" },
            })
        end,
    },
}
