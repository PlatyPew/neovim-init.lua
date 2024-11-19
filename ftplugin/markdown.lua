vim.api.nvim_set_hl(0, "ColorColumn", {})
vim.cmd("setlocal spell")

-- stylua: ignore start
local remap = vim.keymap.set
remap("n", "<Leader>MM", "<Cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle Markdown Preview" })
remap("n", "<Leader>ML", function() require("nabla").popup() end, { desc = "Preview Latex Equations" })
remap("n", "<Leader>Ml", function()
    require("nabla").popup()
    vim.o.wrap = true
end, { desc = "Preview Latex Equations" })
-- stylua: ignore end
