return {
    {
        -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-refactor",
            "HiPhish/rainbow-delimiters.nvim",
        },
        init = function()
            vim.o.foldenable = false
            vim.o.foldlevel = 20
            vim.o.foldexpr = "nvim_treesitter#foldexpr()"
        end,
        opts = {
            ensure_installed = { "c", "python", "javascript" },
            sync_install = false,
            ignore_install = {},
            modules = {},
            auto_install = true,
            context_commentstring = {
                enable = true,
                enable_autocmd = false,
            },
            highlight = {
                enable = true,
                disable = {},
                additional_vim_regex_highlighting = false,
            },
            refactor = {
                highlight_definitions = { enable = true },
                smart_rename = {
                    enable = true,
                    keymaps = {
                        smart_rename = "gR",
                    },
                },
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)

            local hl = vim.api.nvim_set_hl
            hl(0, "TSDefinitionUsage", { underline = true })

            require("rainbow-delimiters").enable()
        end,
    },

    {
        "windwp/nvim-ts-autotag",
        dependencies = "nvim-treesitter/nvim-treesitter",
        ft = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "xml" },
        opts = {},
    },
}
