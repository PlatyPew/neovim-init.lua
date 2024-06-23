return {
    {
        "danymat/neogen",
        cmd = "Neogen",
        -- stylua: ignore
        keys = {
            { "<Leader>D", "<Cmd>Neogen<CR>", desc = "Generate Docs" },
        },
        opts = {
            snippet_engine = "luasnip",
        },
    },
}
