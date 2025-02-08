return {
    {
        "echasnovski/mini.files",
        keys = {
            { "<Leader>o", function() MiniFiles.open() end, desc = "File Explorer" },
        },
        init = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
        end,
        config = true,
    },
}
