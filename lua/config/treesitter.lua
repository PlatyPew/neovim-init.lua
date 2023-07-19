require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "python", "javascript" },
    autotag = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = true,
    },
    refactor = {
        highlight_definitions = { enable = true },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "gR",
            },
        },
    },
    rainbow = {
        enable = true,
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
    },
})

vim.api.nvim_set_hl(0, "TSDefinitionUsage", { underline = true })

vim.api.nvim_set_hl(0, "TSRainbowRed", { fg = vim.g.catppuccin_red })
vim.api.nvim_set_hl(0, "TSRainbowOrange", { fg = vim.g.catppuccin_peach })
vim.api.nvim_set_hl(0, "TSRainbowYellow", { fg = vim.g.catppuccin_yellow })
vim.api.nvim_set_hl(0, "TSRainbowGreen", { fg = vim.g.catppuccin_green })
vim.api.nvim_set_hl(0, "TSRainbowCyan", { fg = vim.g.catppuccin_sapphire })
vim.api.nvim_set_hl(0, "TSRainbowBlue", { fg = vim.g.catppuccin_blue })
vim.api.nvim_set_hl(0, "TSRainbowViolet", { fg = vim.g.catppuccin_mauve })
