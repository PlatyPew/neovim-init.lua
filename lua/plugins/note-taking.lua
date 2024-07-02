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

    {
        "jbyuki/nabla.nvim",
        ft = "markdown",
        keys = {
            {
                "<Leader>LL",
                function()
                    require("nabla").popup()
                end,
                desc = "Preview Latex Equations",
            },
            {
                "<Leader>Ll",
                function()
                    require("nabla").toggle_virt()
                    vim.o.wrap = true
                end,
                desc = "Preview Latex Equations",
            },
        },
    },
}
