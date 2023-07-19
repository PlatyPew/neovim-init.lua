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

vim.g.catppuccin_rosewater = "#f5e0dc"
vim.g.catppuccin_flamingo = "#f2cdcd"
vim.g.catppuccin_pink = "#f5c2e7"
vim.g.catppuccin_mauve = "#cba6f7"
vim.g.catppuccin_red = "#f38ba8"
vim.g.catppuccin_maroon = "#eba0ac"
vim.g.catppuccin_peach = "#fab387"
vim.g.catppuccin_yellow = "#f9e2af"
vim.g.catppuccin_green = "#a6e3a1"
vim.g.catppuccin_teal = "#94e2d5"
vim.g.catppuccin_sky = "#89dceb"
vim.g.catppuccin_sapphire = "#74c7ec"
vim.g.catppuccin_blue = "#89b4fa"
vim.g.catppuccin_lavender = "#b4befe"
vim.g.catppuccin_text = "#cdd6f4"
vim.g.catppuccin_subtext1 = "#bac2de"
vim.g.catppuccin_subtext0 = "#a6adc8"
vim.g.catppuccin_overlay2 = "#9399b2"
vim.g.catppuccin_overlay1 = "#7f849c"
vim.g.catppuccin_overlay0 = "#6c7086"
vim.g.catppuccin_surface2 = "#585b70"
vim.g.catppuccin_surface1 = "#45475a"
vim.g.catppuccin_surface0 = "#313244"
vim.g.catppuccin_base = "#1e1e2e"
vim.g.catppuccin_mantle = "#181825"
vim.g.catppuccin_crust = "#11111b"

vim.api.nvim_set_hl(0, "ColorColumn", { fg = vim.g.catppuccin_red, bg = vim.g.catppuccin_crust })
vim.api.nvim_set_hl(0, "VertSplit", { fg = vim.g.catppuccin_overlay0 })
