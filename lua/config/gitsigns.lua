require("gitsigns").setup({
    signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '│' },
        topdelete    = { text = '║' },
        changedelete = { text = '║' },
        untracked    = { text = '┆' },
    },
    numhl = true,
})

vim.api.nvim_set_hl(0, "GitSignsAddLn", { fg = vim.g.catppuccin_crust, bg = vim.g.catppuccin_sky })
vim.api.nvim_set_hl(0, "GitSignsChangeLn", { fg = vim.g.catppuccin_crust, bg = vim.g.catppuccin_yellow })
vim.api.nvim_set_hl(0, "GitSignsDeleteLn", { fg = vim.g.catppuccin_crust, bg = vim.g.catppuccin_maroon })
