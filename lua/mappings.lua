local remap = vim.keymap.set

-- Vanilla
-- Rebinds arrow keys to increase/decrease size of pane while in normal/visual mode
-- Increase horizontal split
remap("n", "<Up>", "<Cmd>resize +2<CR>")
remap("v", "<Up>", "<Cmd>resize +2<CR>")

-- Decrease horizontal split
remap("n", "<Down>", "<Cmd>resize -2<CR>")
remap("v", "<Down>", "<Cmd>resize -2<CR>")

-- Decrease vertical split
remap("n", "<Left>", "<Cmd>vertical resize -2<CR>")
remap("v", "<Left>", "<Cmd>vertical resize -2<CR>")

-- Increase vertical split
remap("n", "<Right>", "<Cmd>vertical resize +2<CR>")
remap("v", "<Right>", "<Cmd>vertical resize +2<CR>")

-- Remap semicolon to colon
remap("n", ";", ":")
remap("v", ";", ":")

-- Cycling buffers
remap("n", "<Leader>bh", "<Cmd>:bfirst<CR>")
remap("n", "<Leader>bj", "<Cmd>:bnext<CR>")
remap("n", "<Leader>bk", "<Cmd>:bprevious<CR>")
remap("n", "<Leader>bl", "<Cmd>:blast<CR>")
remap("n", "<Leader>bq", "<Cmd>bdelete<CR>")

-- Stops cursor from flying everywhere
remap("n", "n", "nzzzv")
remap("n", "N", "Nzzzv")

-- Prevents pasted over text from replacing register
remap("x", "p", "pgvy")

-- Better undo breakpoints
remap("i", ",", ",<C-g>u")
remap("i", ".", ".<C-g>u")

-- Move stuff in visual mode
remap("v", "J", [[:m '>+1'<CR>gv=gv]])
remap("v", "K", [[:m '<-2'<CR>gv=gv]])
remap("v", "H", "<gv")
remap("v", "L", ">gv")

-- Indent when going into insert mode
remap("n", "i", function()
    if #vim.fn.getline(".") == 0 then
        return [["_cc]]
    else
        return "i"
    end
end, { expr = true })

-- Adjust transparency
remap("n", "<Leader>T", [[<Cmd>Transparency<CR>]])

-- FZF-Lua
remap("n", "<C-p>", function()
    require("fzf-lua").files({ cmd = [[ rg --files --hidden --no-ignore-vcs -g "!.git/*" ]] })
end)
remap("n", "<C-g>", function()
    require("fzf-lua").live_grep_native()
end)

remap("n", "g=", function()
    vim.lsp.buf.format({ async = true })
end)

-- LSPSaga
remap("n", "[g", "<Cmd>Lspsaga diagnostic_jump_prev<CR>")
remap("n", "]g", "<Cmd>Lspsaga diagnostic_jump_next<CR>")
remap("n", "gc", "<Cmd>Lspsaga code_action<CR>")
remap("n", "gp", "<Cmd>Lspsaga peek_definition<CR>")
remap("n", "gf", "<Cmd>Lspsaga finder<CR>")
remap("n", "gh", "<Cmd>Lspsaga hover_doc<CR>")
remap("n", "gr", "<Cmd>Lspsaga rename<CR>")

-- UndoTree
remap("n", "<Tab>", "<Cmd>UndotreeToggle<CR>")

-- Instant
remap("n", "<Leader>Is", function()
    _G.InstantStartSession()
end)
remap("n", "<Leader>Ij", function()
    _G.InstantJoinSession()
end)
remap("n", "<Leader>Iq", function()
    _G.InstantStopSession()
end)
remap("n", "<Leader>IQ", function()
    _G.InstantStopServer()
end)

-- Gitsigns
remap("n", "<Leader>hd", function()
    require("gitsigns").diffthis()
end)
remap("n", "]c", function()
    require("gitsigns").next_hunk()
end)
remap("n", "[c", function()
    require("gitsigns").prev_hunk()
end)

-- DAP
remap("n", "<F5>", function()
    require("dap").continue()
end)
remap("n", "<F6>", function()
    require("dap").toggle_breakpoint()
end)
remap("n", "<F10>", function()
    require("dap").step_over()
end)
remap("n", "<F11>", function()
    require("dap").step_into()
end)
remap("n", "<F12>", function()
    require("dap").step_out()
end)
remap("n", "<Leader>dc", function()
    require("dap").close()
end)
remap("n", "<Leader>dr", function()
    require("dap").repl.open()
end)
remap("n", "<Leader>du", function()
    require("dapui").toggle()
end)
remap("n", "<Leader>de", function()
    require("dapui").eval()
end)

-- SnipRun
remap("n", "<Leader>f", "<Plug>SnipRun")
remap("v", "f", "<Plug>SnipRun")

-- Harpoon
remap("n", "mm", function()
    require("harpoon.ui").toggle_quick_menu()
end)
remap("n", "mh", function()
    require("harpoon.mark").add_file()
end)
remap("n", "]m", function()
    require("harpoon.ui").nav_next()
end)
remap("n", "[m", function()
    require("harpoon.ui").nav_prev()
end)
