require("nvim-treesitter.configs").setup({
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

vim.api.nvim_set_hl(0, "TSRainbowRed", { fg = "#cf637e" })
vim.api.nvim_set_hl(0, "TSRainbowOrange", { fg = "#f4a261" })
vim.api.nvim_set_hl(0, "TSRainbowYellow", { fg = "#dbc074" })
vim.api.nvim_set_hl(0, "TSRainbowGreen", { fg = "#aace8d" })
vim.api.nvim_set_hl(0, "TSRainbowCyan", { fg = "#73d2d4" })
vim.api.nvim_set_hl(0, "TSRainbowBlue", { fg = "#90c7f4" })
vim.api.nvim_set_hl(0, "TSRainbowViolet", { fg = "#d59ee6" })
