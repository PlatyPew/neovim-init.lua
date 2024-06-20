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
            if vim.g.neovide then
                opts.transparent_background = false
            end

            local catppuccin = require("catppuccin")
            catppuccin.setup(opts)

            vim.g.palette = require("catppuccin.palettes").get_palette()

            vim.cmd.syntax("on")
            vim.cmd.colorscheme("catppuccin")

            local hl = vim.api.nvim_set_hl
            hl(0, "ColorColumn", { fg = vim.g.palette.red, bg = vim.g.palette.crust })
            hl(0, "VertSplit", { fg = vim.g.palette.overlay0 })
        end,
    },

    {
        "echasnovski/mini.hipatterns",
        event = { "BufReadPost", "BufNewFile" },
        opts = {},
    },
}
