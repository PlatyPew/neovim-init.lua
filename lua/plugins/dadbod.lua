return {
    {
        "kristijanhusak/vim-dadbod-ui",
        dependencies = {
            { "tpope/vim-dadbod", lazy = true },
        },
        cmd = {
            "DB",
            "DBUI",
            "DBUIToggle",
            "DBUIAddConnection",
            "DBUIFindBuffer",
        },
        keys = {
            { "<Leader>S", "<Cmd>DBUIToggle<CR>", desc = "Toggle DB UI" },
        },
    },
}
