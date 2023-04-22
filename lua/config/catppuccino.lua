vim.g.transparent = true
local catppuccino = require("catppuccino")

catppuccino.setup({
    colorscheme = "soft_manilo",
    transparency = vim.g.transparent,
})

function transparency()
    vim.g.transparent = not vim.g.transparent
    catppuccino.setup({ transparency = vim.g.transparent })
    vim.cmd.colorscheme("catppuccino")
end
vim.api.nvim_create_user_command("Transparency", "lua transparency()", {})

vim.cmd.syntax("on")
vim.cmd.colorscheme("catppuccino")

vim.api.nvim_set_hl(0, "ColorColumn", { fg = "#d84652", bg = "#000000" })
vim.api.nvim_set_hl(0, "VertSplit", { fg = "#526175" })
