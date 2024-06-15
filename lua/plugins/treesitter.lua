return {
    {
        -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
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
                additional_vim_regex_highlighting = true,
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
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["ia"] = "@parameter.inner",
                        ["aa"] = "@parameter.outer",
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        ["ii"] = "@conditional.inner",
                        ["ai"] = "@conditional.outer",
                        ["il"] = "@loop.inner",
                        ["al"] = "@loop.outer",
                        ["at"] = "@comment.outer",
                    },
                },
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)

            local hl = vim.api.nvim_set_hl

            hl(0, "TSDefinitionUsage", { underline = true })

            require("rainbow-delimiters").enable()
            hl(0, "RainbowDelimeterRed", { fg = vim.g.catppuccin_red })
            hl(0, "RainbowDelimeterOrange", { fg = vim.g.catppuccin_peach })
            hl(0, "RainbowDelimeterYellow", { fg = vim.g.catppuccin_yellow })
            hl(0, "RainbowDelimeterGreen", { fg = vim.g.catppuccin_green })
            hl(0, "RainbowDelimeterCyan", { fg = vim.g.catppuccin_sapphire })
            hl(0, "RainbowDelimeterBlue", { fg = vim.g.catppuccin_blue })
            hl(0, "RainbowDelimeterViolet", { fg = vim.g.catppuccin_mauve })
        end,
    },

    {
        "windwp/nvim-ts-autotag",
        after = "nvim-treesitter/nvim-treesitter",
        ft = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "xml" },
        opts = {},
    },
}
