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
local dashboard = augroup("dashboard_au", {})
autocmd("User", {
    pattern = "DashboardReady",
    command = "nnoremap <buffer> i <Cmd>enew<CR>i",
    group = dashboard,
})
autocmd(
    "User",
    { pattern = "DashboardReady", command = "nnoremap <buffer> e <Cmd>enew<CR>", group = dashboard }
)
autocmd(
    "User",
    { pattern = "DashboardReady", command = "nnoremap <buffer> q <Cmd>exit<CR>", group = dashboard }
)

-- Null-ls
local null_ls = augroup("null-ls_au", {})
autocmd("BufReadPost", {
    pattern = "*",
    command = "lua local nls = require('null-ls'); nls.enable({ name = 'cspell', method = nls.methods.DIAGNOSTICS })",
    group = null_ls,
})

-- Terminal
local term = augroup("term_au", {})
autocmd("TermOpen", {
    pattern = "*",
    command = "setlocal nonumber norelativenumber",
    group = term,
})
autocmd("WinEnter", {
    pattern = "term://*",
    command = "nohlsearch",
    group = term,
})
autocmd("WinEnter", {
    pattern = "term://*",
    command = "startinsert",
    group = term,
})
autocmd("TermOpen", {
    pattern = "*",
    command = "setlocal listchars= | set nocursorline | set nocursorcolumn",
    group = term,
})

-- Fix oil lazy load but override netrw
local oil = augroup("oil_au", {})
autocmd("UIEnter", {
    pattern = "*",
    callback = function()
        local dir = vim.fn.expand("%:p")
        if vim.fn.isdirectory(dir) == 1 then
            require("oil").open(dir)
        end
    end,
    group = oil,
})
