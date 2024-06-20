local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Remove comment on newline
autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*",
    command = "setlocal formatoptions-=cro",
})

local highlights = augroup("highlights", { clear = true })
autocmd("FileType", {
    pattern = "*",
    group = highlights,
    command = "if &ft!='dashboard' && &ft!='WhichKey' && &ft!='lazy' && &ft!='mason' && &ft!='fzf' && &ft!='NeogitStatus' | call matchadd('ColorColumn', '\\%101v[^\n]')",
})

-- Fix oil lazy load but override netrw
local oil = augroup("oil_au", {})
autocmd("UIEnter", {
    pattern = "*",
    callback = function()
        if vim.fn.isdirectory(vim.fn.expand("%:p")) == 1 then
            require("oil")
        end
    end,
    group = oil,
})
