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
                harpoon = true,
                leap = true,
                lsp_saga = true,
                mason = true,
                mini = true,
                noice = true,
                overseer = true,
                which_key = true,
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
            }

            catppuccin.setup(opts)

            vim.cmd.colorscheme("catppuccin")

            vim.keymap.set("n", "<Leader>T", "<Cmd>Transparency<CR>", { desc = "Toggle Transparent Background" })
        end,
    },

    {
        "echasnovski/mini.hipatterns",
        event = { "BufReadPost", "BufNewFile" },
        opts = {},
    },
}
