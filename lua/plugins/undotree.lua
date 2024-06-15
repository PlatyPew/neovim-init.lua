return {
    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        keys = {
            { "<Tab>", "<Cmd>UndotreeToggle<CR>", desc = "Toggle Undotree" },
            { "<Leader>u", "<Cmd>UndotreeToggle<CR>", desc = "Toggle UndoTree" },
        },
        init = function()
            vim.o.undodir = vim.fn.stdpath("cache") .. "/undotree"
            vim.o.undofile = true
        end,
    },
}
