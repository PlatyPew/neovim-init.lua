return {
    {
        "ggandor/leap.nvim",
        -- stylua: ignore
        keys = {
            { "s", "<Plug>(leap)" },
            { "S", "<Plug>(leap-cross-window)" },
            { "S", "<Plug>(leap)", mode = { "x", "o" } },
        },
        dependencies = { "tpope/vim-repeat" },
        config = function()
            require("leap").set_default_keymaps()

            local hl = vim.api.nvim_set_hl
            hl(0, "LeapLabelPrimary", {
                fg = vim.g.palette.crust,
                bg = vim.g.palette.red,
            })
            hl(0, "LeapBackdrop", { link = "Comment" })
        end,
    },

    {
        "chrisgrieser/nvim-spider",
        -- stylua: ignore
        keys = {
            { "w", function() require("spider").motion("w") end, mode = { "n", "o", "x" } },
            { "e", function() require("spider").motion("e") end, mode = { "n", "o", "x" } },
            { "b", function() require("spider").motion("b") end, mode = { "n", "o", "x" } },
            { "ge", function() require("spider").motion("ge") end, mode = { "n", "o", "x" } },
        },
    },

    {
        "jonatan-branting/nvim-better-n",
        keys = { "n", "N", "f", "F", "t", "T", "/", "?" },
        lazy = true,
        opts = {},
    },
}
