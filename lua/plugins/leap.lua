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
}
