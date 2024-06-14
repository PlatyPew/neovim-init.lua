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
                            color = { fg = vim.g.catppuccin_overlay0 },
                        },
                        "%S",
                        "location",
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
                                error = { bg = vim.g.catppuccin_base, fg = vim.g.catppuccin_red },
                                warn = { bg = vim.g.catppuccin_base, fg = vim.g.catppuccin_peach },
                                info = { bg = vim.g.catppuccin_base, fg = vim.g.catppuccin_yellow },
                                hint = { bg = vim.g.catppuccin_base, fg = vim.g.catppuccin_sky },
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
                                    bg = vim.g.catppuccin_surface0,
                                    fg = vim.g.catppuccin_text,
                                },
                            },
                            padding = 1,
                            filetype_names = {
                                dashboard = "󰕮 Dashboard",
                                mason = "󰇚 Mason",
                                undotree = " UndoTree",
                                lspinfo = " LSP Info",
                                lazy = "󰒲 Lazy",
                                harpoon = "󱡅 Harpoon",
                                oil = "󰏇 Oil",
                            },
                        },
                    },
                    lualine_y = {
                        function()
                            return [[buffers]]
                        end,
                    },
                },
                extensions = { "nvim-dap-ui", "quickfix" },
            })
        end,
    },
}
