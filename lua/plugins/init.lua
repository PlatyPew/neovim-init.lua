return {
    {
        "altermo/ultimate-autopair.nvim",
        event = { "InsertEnter", "CmdlineEnter" },
        branch = "v0.6",
        opts = {},
    },

    {
        "machakann/vim-highlightedyank",
        event = "VeryLazy",
        config = function()
            vim.api.nvim_set_hl(0, "HighlightedyankRegion", { reverse = true })
            vim.g.highlightedyank_highlight_duration = 200
        end,
    },

    {
        "KeitaNakamura/tex-conceal.vim",
        ft = "tex",
    },

    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
    },

    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },

    {
        "lambdalisue/suda.vim",
        cmd = { "SudaWrite", "SudaRead" },
    },

    {
        "ojroques/nvim-osc52",
        lazy = true,
        opts = { trim = false, silent = true },
    },

    {
        "christoomey/vim-tmux-navigator",
        event = "VeryLazy",
    },

    {
        "kkoomen/vim-doge",
        build = ":call doge#install()",
        cmd = "DogeGenerate",
    },
}
