local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Remove comment on newline
autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*",
    command = "setlocal formatoptions-=cro",
})

-- Syntax highlight
local highlights = augroup("highlights", { clear = true })
autocmd("FileType", {
    pattern = "*",
    group = highlights,
    command = "if &ft!='dashboard' && &ft!='WhichKey' && &ft!='lazy' && &ft!='mason' | call matchadd('ColorColumn', '\\%101v[^\n]')",
})
autocmd("FileType", {
    pattern = { "text", "markdown" },
    group = highlights,
    command = "setlocal spell",
})
autocmd("FileType", {
    pattern = { "text", "markdown" },
    group = highlights,
    callback = function()
        vim.api.nvim_set_hl(0, "ColorColumn", {})
    end,
})

autocmd("FileType", {
    pattern = { "yaml" },
    callback = function()
        vim.o.shiftwidth = 4
    end,
})

-- Dashboard
local dashboard = vim.api.nvim_create_augroup("dashboard_au", {})
vim.api.nvim_create_autocmd("User", {
    pattern = "DashboardReady",
    command = "nnoremap <buffer> i <Cmd>enew<CR>i",
    group = dashboard,
})
vim.api.nvim_create_autocmd(
    "User",
    { pattern = "DashboardReady", command = "nnoremap <buffer> e <Cmd>enew<CR>", group = dashboard }
)
vim.api.nvim_create_autocmd(
    "User",
    { pattern = "DashboardReady", command = "nnoremap <buffer> q <Cmd>exit<CR>", group = dashboard }
)

-- Null-ls
local null_ls = vim.api.nvim_create_augroup("null-ls_au", {})
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    command = "lua local nls = require('null-ls'); nls.enable({ name = 'cspell', method = nls.methods.DIAGNOSTICS })",
    group = null_ls,
})

-- Terminal
local term = vim.api.nvim_create_augroup("term_au", {})
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    command = "setlocal nonumber norelativenumber",
    group = term,
})
vim.api.nvim_create_autocmd("WinEnter", {
    pattern = "term://*",
    command = "nohlsearch",
    group = term,
})
vim.api.nvim_create_autocmd("WinEnter", {
    pattern = "term://*",
    command = "startinsert",
    group = term,
})
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    command = "setlocal listchars= | set nocursorline | set nocursorcolumn",
    group = term,
})

-- Fix nvim tree lazy load but override netrw
local nvimtree = vim.api.nvim_create_augroup("nvimtree_au", {})
vim.api.nvim_create_autocmd("UIEnter", {
    pattern = "*",
    callback = function()
        if vim.fn.isdirectory(vim.fn.expand("%:p")) == 1 then
            vim.cmd("NvimTreeToggle")
        end
    end,
    group = nvimtree,
})
