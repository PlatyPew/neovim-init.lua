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

vim.api.nvim_set_hl(0, "TSRainbowRed", { fg = "#f38ba8" })
vim.api.nvim_set_hl(0, "TSRainbowOrange", { fg = "#fab387" })
vim.api.nvim_set_hl(0, "TSRainbowYellow", { fg = "#f9e2af" })
vim.api.nvim_set_hl(0, "TSRainbowGreen", { fg = "#a6e3a1" })
vim.api.nvim_set_hl(0, "TSRainbowCyan", { fg = "#74c7ec" })
vim.api.nvim_set_hl(0, "TSRainbowBlue", { fg = "#89b4fa" })
vim.api.nvim_set_hl(0, "TSRainbowViolet", { fg = "#cba6f7" })
