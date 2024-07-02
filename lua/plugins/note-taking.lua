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
                "<Leader>L",
                function()
                    require("nabla").popup()
                end,
                desc = "Preview Latex Equations",
            },
        },
        config = function()
            require("nabla").enable_virt()
            vim.o.wrap = true

            local conceal = vim.api.nvim_create_augroup("conceal", {})
            vim.api.nvim_create_autocmd("InsertEnter", {
                pattern = "*.md",
                command = "setlocal conceallevel=0",
                group = conceal,
            })

            vim.api.nvim_create_autocmd("InsertLeave", {
                pattern = "*.md",
                command = "setlocal conceallevel=2",
                group = conceal,
            })
        end,
    },
}
