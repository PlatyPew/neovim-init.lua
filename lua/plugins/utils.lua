return {
    {
        "machakann/vim-highlightedyank",
        event = "UIEnter",
        config = function()
            vim.g.highlightedyank_highlight_duration = 200
        end,
    },

    {
        "MagicDuck/grug-far.nvim",
        cmd = "GrugFar",
        -- stylua: ignore
        keys = {
            { "<D-f>", "<Cmd>GrugFar<CR>", desc = "Replace in Files" },
            { "<Leader>s", "<Cmd>GrugFar<CR>", desc = "Replace in Files" },
        },
        opts = {
            windowCreationCommand = "noswapfile vsplit",
            placeholders = {
                enabled = false,
            },
            keymaps = {
                close = { n = "q" },
            },
        },
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
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        -- stylua: ignore
        keys = {
            { "<Tab>", "<Cmd>UndotreeToggle<CR>", desc = "Toggle Undotree" },
            { "<Leader>u", "<Cmd>UndotreeToggle<CR>", desc = "Toggle UndoTree" },
        },
        init = function()
            vim.o.undodir = vim.fn.stdpath("cache") .. "/undotree"
            vim.o.undofile = true
        end,
    },

    {
        "kevinhwang91/nvim-bqf",
        ft = "qf",
        opts = {
            preview = {
                winblend = 0,
            },
        },
    },

    {
        "pteroctopus/faster.nvim",
        event = "BufReadPre",
        opts = {
            behaviours = {
                bigfile = {
                    filesize = 0.5,
                    features_disabled = {
                        "matchparen",
                        "lsp",
                        "treesitter",
                        "vimopts",
                        "syntax",
                        "filetype",
                        "rainbow",
                    },
                },
            },
            features = {
                rainbow = {
                    on = true,
                    defer = false,
                    enable = function()
                        require("rainbow-delimiters").enable(0)
                    end,
                    disable = function()
                        require("rainbow-delimiters").disable(0)
                    end,
                    commands = function()
                        vim.api.nvim_create_user_command("FasterEnableRainbow", function()
                            require("rainbow-delimiters").enable(0)
                        end, {})
                        vim.api.nvim_create_user_command("FasterDisableRainbow", function()
                            require("rainbow-delimiters").disable(0)
                        end, {})
                    end,
                },
            },
        },
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeoutlen = 300
        end,
        opts = {
            ignore_missing = true,
            window = {
                border = "double",
            },
        },
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)

            wk.register({
                R = { name = "Overseer" },
                M = { name = "Markdown" },
                c = { name = "Copilot" },
                d = { name = "DAP", f = { name = "FZF" } },
                f = { name = "FZF" },
                g = { name = "Git" },
                i = {
                    name = "Installers",
                    l = { "<Cmd>Lazy<CR>", "Plugin Manager" },
                    m = { "<Cmd>Mason<CR>", "LSP Installer" },
                },
                j = { name = "Molten" },
                l = {
                    name = "LSP",
                    I = { "<Cmd>LspInfo<CR>", "LSP Info" },
                    f = { name = "FZF" },
                },
                m = { name = "Harpoon" },
                r = { name = "Sniprun" },
            }, { mode = "n", prefix = "<Leader>" })

            wk.register({
                c = {
                    name = "Copilot",
                },
                s = {
                    name = "Git",
                },
                r = {
                    name = "Sniprun",
                },
            }, { mode = "v", prefix = "<Leader>" })
        end,
    },
}
