return {
    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        cmd = "MarkdownPreviewToggle",
        keys = {
            { "<Leader>MM", "<Cmd>MarkdownPreviewToggle<CR>", desc = "Toggle Markdown Preview" },
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
        "MeanderingProgrammer/markdown.nvim",
        ft = "markdown",
        dependencies = {
            "nvim-treesitter/nvim-treesitter", -- Mandatory
            "nvim-tree/nvim-web-devicons", -- Optional but recommended
        },
        opts = {
            latex_enabled = false,
        },
        config = function(_, opts)
            require("render-markdown").setup(opts)
            vim.keymap.set("n", "<Leader>MR", function()
                require("render-markdown").toggle()
            end, { desc = "Toggle Markdown Render" })
        end,
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
