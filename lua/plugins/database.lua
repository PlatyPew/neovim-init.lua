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
        -- stylua: ignore
        keys = {
            { "<Leader>S", "<Cmd>DBUIToggle<CR>", desc = "Toggle DB UI" },
        },
    },
}
