return {
    {
        "m4xshen/hardtime.nvim",
        dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
        cond = function()
            return os.getenv("USER") == "daryllim"
        end,
        opts = {
            max_count = 3,
            max_time = 1000,
            disable_mouse = false,
            disabled_keys = {
                ["<Up>"] = {},
                ["<Down>"] = {},
                ["<Left>"] = {},
                ["<Right>"] = {},
                ["<Space>"] = { "n", "x" },
            },
            disabled_filetypes = {
                "qf",
                "lazy",
                "mason",
                "oil",
                "dashboard",
                "dbui",
            },
        },
    },
}
