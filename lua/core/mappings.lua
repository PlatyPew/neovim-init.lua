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
remap("n", "<Leader>bh", "<Cmd>:bfirst<CR>", { desc = "Cycle First Buffer" })
remap("n", "<Leader>bj", "<Cmd>:bnext<CR>", { desc = "Cycle Next Buffer" })
remap("n", "<Leader>bk", "<Cmd>:bprevious<CR>", { desc = "Cycle Previous Buffer" })
remap("n", "<Leader>bl", "<Cmd>:blast<CR>", { desc = "Cycle Last Buffer" })
remap("n", "<Leader>bq", "<Cmd>bdelete<CR>", { desc = "Delete Buffer" })

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
