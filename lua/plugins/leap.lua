return {
    {
        "ggandor/leap.nvim",
        keys = {
            { "s", "<Plug>(leap)" },
            { "S", "<Plug>(leap-cross-window)" },
        },
        dependencies = { "tpope/vim-repeat" },
        config = function()
            require("leap").set_default_keymaps()
            vim.api.nvim_set_hl(0, "LeapLabelPrimary", {
                fg = vim.g.catppuccin_crust,
                bg = vim.g.catppuccin_red,
            })
            vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
        end,
    },
}
