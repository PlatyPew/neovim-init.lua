vim.g.transparent = true
local catppuccin = require("catppuccin")

catppuccin.setup({
    flavour = "mocha",
    background = {
        light = "latte",
        dark = "mocha",
    },
    transparent_background = vim.g.transparent,
})

function transparency()
    vim.g.transparent = not vim.g.transparent
    catppuccin.setup({ transparent_background = vim.g.transparent })
    vim.cmd.colorscheme("catppuccin")
end
vim.api.nvim_create_user_command("Transparency", "lua transparency()", {})

vim.cmd.syntax("on")
vim.cmd.colorscheme("catppuccin")

vim.api.nvim_set_hl(0, "ColorColumn", { fg = "#d84652", bg = "#11111b" })
vim.api.nvim_set_hl(0, "VertSplit", { fg = "#6c7086" })
