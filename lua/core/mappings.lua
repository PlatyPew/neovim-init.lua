local remap = vim.keymap.set

-- Vanilla
-- Rebinds arrow keys to increase/decrease size of pane while in normal/visual mode
-- Increase horizontal split
remap({ "n", "x" }, "<Up>", "<Cmd>resize +2<CR>")

-- Decrease horizontal split
remap({ "n", "x" }, "<Down>", "<Cmd>resize -2<CR>")

-- Decrease vertical split
remap({ "n", "x" }, "<Left>", "<Cmd>vertical resize -2<CR>")

-- Increase vertical split
remap({ "n", "x" }, "<Right>", "<Cmd>vertical resize +2<CR>")

-- Remap semicolon to colon
remap({ "n", "x" }, ";", ":")

-- Cycling buffers
remap("n", "<Leader>bo", "<Cmd>enew<CR>", { desc = "Open New Buffer" })
remap("n", "<Leader>bh", "<Cmd>bfirst<CR>", { desc = "Cycle First Buffer" })
remap("n", "<Leader>bj", "<Cmd>bnext<CR>", { desc = "Cycle Next Buffer" })
remap("n", "<Leader>bk", "<Cmd>bprevious<CR>", { desc = "Cycle Previous Buffer" })
remap("n", "<Leader>bl", "<Cmd>blast<CR>", { desc = "Cycle Last Buffer" })
remap("n", "<Leader>bq", "<Cmd>bdelete!<CR>", { desc = "Delete Buffer" })

-- Quickfix lists
remap("n", "<Leader>qo", "<Cmd>copen<CR>", { desc = "Open Quickfix List" })
remap("n", "<Leader>qh", "<Cmd>cfirst<CR>", { desc = "Cycle First Quickfix List" })
remap("n", "<Leader>qh", "<Cmd>cnext<CR>", { desc = "Cycle Next Quickfix List" })
remap("n", "<Leader>qk", "<Cmd>cprevious<CR>", { desc = "Cycle Previous Quickfix List" })
remap("n", "<Leader>ql", "<Cmd>clast<CR>", { desc = "Cycle Last Quickfix List" })
remap("n", "<Leader>qq", "<Cmd>cclose<CR>", { desc = "Close Quickfix List" })

-- Stops cursor from flying everywhere
remap("n", "n", "nzzzv")
remap("n", "N", "Nzzzv")
remap("n", "<C-d>", "<C-d>zz")
remap("n", "<C-u>", "<C-u>zz")

-- Easier copy to clipboard
remap({ "n", "x" }, "<Leader>y", '"+y', { desc = "Yank To Clipboard" })
remap("n", "<Leader>Y", '"+y$', { desc = "Yank Line To Clipboard" })

-- Prevents pasted over text from replacing register
remap("x", "p", "pgvy")

-- Better undo breakpoints
remap("i", ",", ",<C-g>u")
remap("i", ".", ".<C-g>u")

-- Indent when going into insert mode
remap("n", "i", function()
    return #vim.fn.getline(".") == 0 and [["_cc]] or "i"
end, { expr = true })

-- Better escape for terminal
remap("t", "<C-Esc>", "<C-\\><C-n>")

-- Mappings for Comment
remap("n", "gc", "<cmd>set operatorfunc=v:lua.__toggle_contextual<CR>g@")
remap("x", "gc", "<cmd>set operatorfunc=v:lua.__toggle_contextual<CR>g@")
