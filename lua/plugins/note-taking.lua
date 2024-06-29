return {
    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        cmd = "MarkdownPreviewToggle",
        keys = {
            { "<Leader>M", "<Cmd>MarkdownPreviewToggle<CR>", desc = "Toggle Markdown Preview" },
        },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },

    {
        "HakonHarnes/img-clip.nvim",
        cmd = "PasteImage",
        keys = {
            { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste Image" },
        },
    },

    {
        "OXY2DEV/markview.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        ft = "markdown",
        opts = {},
    },
}
