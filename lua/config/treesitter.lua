require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "python", "javascript" },
    sync_install = false,
    ignore_install = {},
    modules = {},
    auto_install = true,
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
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["ia"] = "@parameter.inner",
                ["aa"] = "@parameter.outer",
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["ii"] = "@conditional.inner",
                ["ai"] = "@conditional.outer",
                ["il"] = "@loop.inner",
                ["al"] = "@loop.outer",
                ["at"] = "@comment.outer",
            },
        },
    },
})

vim.api.nvim_set_hl(0, "TSDefinitionUsage", { underline = true })

require("rainbow-delimiters").enable()

vim.api.nvim_set_hl(0, "RainbowDelimeterRed", { fg = vim.g.catppuccin_red })
vim.api.nvim_set_hl(0, "RainbowDelimeterOrange", { fg = vim.g.catppuccin_peach })
vim.api.nvim_set_hl(0, "RainbowDelimeterYellow", { fg = vim.g.catppuccin_yellow })
vim.api.nvim_set_hl(0, "RainbowDelimeterGreen", { fg = vim.g.catppuccin_green })
vim.api.nvim_set_hl(0, "RainbowDelimeterCyan", { fg = vim.g.catppuccin_sapphire })
vim.api.nvim_set_hl(0, "RainbowDelimeterBlue", { fg = vim.g.catppuccin_blue })
vim.api.nvim_set_hl(0, "RainbowDelimeterViolet", { fg = vim.g.catppuccin_mauve })
