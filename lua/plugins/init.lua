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
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        cmd = "MarkdownPreviewToggle",
        keys = {
            { "<Leader>m", "<Cmd>MarkdownPreviewToggle<CR>", desc = "Toggle Markdown Preview" },
        },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },

    {
        "lambdalisue/suda.vim",
        cmd = { "SudaWrite", "SudaRead" },
        keys = {
            { "<Leader>W", "<Cmd>SudaWrite<CR>", desc = "Sudo Write" },
        },
        init = function()
            vim.api.nvim_create_user_command("W", "SudaWrite", {})
        end,
    },

    {
        "christoomey/vim-tmux-navigator",
        event = "VeryLazy",
    },

    {
        "kkoomen/vim-doge",
        build = ":call doge#install()",
        cmd = "DogeGenerate",
        keys = {
            { "<Leader>D", "<Cmd>DogeGenerate<CR>", desc = "Generate Docs" },
        },
    },

    {
        "kevinhwang91/nvim-bqf",
        ft = "qf",
    },
}
