local opt = vim.o
local glo = vim.g

-- Optimisation
opt.foldmethod = "expr"
opt.ruler = false

-- Colouring
opt.termguicolors = true

-- Configurations
opt.cursorline = true
opt.encoding = "utf-8"
opt.expandtab = true
opt.list = true
opt.listchars = "tab:»·,trail:·,nbsp:·"
opt.mouse = "nvi"
opt.number = true
opt.relativenumber = true
opt.shiftwidth = 4
opt.showmode = false
opt.softtabstop = 4
opt.spelllang = "en_gb"
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 4
opt.updatetime = 50
opt.whichwrap = "b,s,<,>,h,l"
opt.wrap = true
opt.cmdheight = 0
opt.showcmdloc = "statusline"

-- Copy Paste
local function copy(lines, _)
    require("osc52").copy(table.concat(lines, "\n"))
end

glo.clipboard = {
    name = "osc52",
    copy = { ["+"] = copy, ["*"] = copy },
    paste = { ["+"] = "pbpaste", ["*"] = "pbpaste" },
}

-- Disable netrw
glo.loaded_netrw = 1
glo.loaded_netrwPlugin = 1

-- TreeSitter
opt.foldenable = false
opt.foldlevel = 20
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- WhichKey
opt.timeoutlen = 500

-- UndoTree
opt.undodir = vim.fn.stdpath("cache") .. "/undotree"
opt.undofile = true

-- Suda
vim.api.nvim_create_user_command("W", "SudaWrite", {})
