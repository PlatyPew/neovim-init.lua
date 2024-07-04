local opt = vim.o

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

-- Python packages
if vim.fn.isdirectory(vim.fn.stdpath("data") .. "/venv") == 0 then
    if vim.fn.executable("virtualenv") == 1 then
        vim.fn.system("virtualenv " .. vim.fn.stdpath("data") .. "/venv")
    end
end

vim.g.python3_host_prog = vim.fn.stdpath("data") .. "/venv/bin/python"
