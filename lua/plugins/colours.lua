return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            flavour = "mocha",
            background = {
                light = "latte",
                dark = "mocha",
            },
            transparent_background = true,
            integrations = {
                cmp = true,
                diffview = true,
                leap = true,
                lsp_saga = true,
                mason = true,
                mini = true,
                noice = true,
                overseer = true,
                which_key = true,

                native_lsp = {
                    enabled = true,
                    underlines = {
                        errors = { "undercurl" },
                        hints = { "undercurl" },
                        warnings = { "undercurl" },
                        information = { "undercurl" },
                        ok = { "undercurl" },
                    },
                },
            },
        },
        config = function(_, opts)
            local catppuccin = require("catppuccin")

            if vim.g.neovide then
                opts.transparent_background = false
            end

            local function transparency()
                catppuccin.setup({
                    transparent_background = not catppuccin.options.transparent_background,
                })
                vim.cmd.colorscheme("catppuccin")
                vim.cmd("edit")
            end
            vim.api.nvim_create_user_command("Transparency", transparency, {})

            vim.g.palette = require("catppuccin.palettes").get_palette()

            opts.custom_highlights = {
                ColorColumn = { fg = vim.g.palette.red, bg = vim.g.palette.crust },
                VertSplit = { fg = vim.g.palette.overlay0 },

                CmpItemAbbrMatch = { fg = vim.g.palette.sapphire },

                DashboardHeader = { fg = vim.g.palette.yellow },
                DashboardFooter = { fg = vim.g.palette.peach },

                TSDefinitionUsage = { underline = true },

                HighlightedyankRegion = { reverse = true },

                LspInlayHint = { fg = vim.g.palette.surface1, italic = true },

                AvanteTitle = { fg = vim.g.palette.crust, bg = vim.g.palette.green },
                AvanteReversedTitle = { fg = vim.g.palette.green },
                AvanteSubtitle = { fg = vim.g.palette.crust, bg = vim.g.palette.sapphire },
                AvanteReversedSubtitle = { fg = vim.g.palette.sapphire },
                AvanteThirdTitle = { fg = vim.g.palette.text, bg = vim.g.palette.surface1 },
                AvanteReversedThirdTitle = { fg = vim.g.palette.surface1 },
            }

            catppuccin.setup(opts)

            vim.cmd.colorscheme("catppuccin")

            vim.keymap.set(
                "n",
                "<Leader>T",
                "<Cmd>Transparency<CR>",
                { desc = "Toggle Transparent Background" }
            )
        end,
    },

    {
        "echasnovski/mini.hipatterns",
        event = { "BufReadPost", "BufNewFile" },
        config = true,
    },
}
