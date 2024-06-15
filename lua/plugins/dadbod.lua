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
            { "<Leader>RO", "<Cmd>OverseerToggle right<CR>", desc = "Toggles overseer window" },
            { "<Leader>RR", "<Cmd>OverseerRun<CR>", desc = "Run builtin" },
            { "<Leader>Rr", "<Cmd>OverseerRunCmd<CR>", desc = "Run command" },
        },
    },
}
