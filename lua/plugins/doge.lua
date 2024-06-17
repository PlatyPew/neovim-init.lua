return {
    {
        "kkoomen/vim-doge",
        build = ":call doge#install()",
        cmd = "DogeGenerate",
        keys = {
            { "<Leader>D", "<Cmd>DogeGenerate<CR>", desc = "Generate Docs" },
        },
    },
}
