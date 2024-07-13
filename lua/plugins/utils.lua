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
        opts = {
            preset = "modern",
            notify = false,
            icons = {
                rules = false, -- TODO: Fix icons one day
            },
        },
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)

            wk.add({
                { "<Leader>L", group = "Latex" },
                { "<Leader>R", group = "Overseer" },
                { "<Leader>M", group = "Markdown" },
                { "<Leader>b", group = "Buffers" },
                { "<Leader>c", group = "Copilot" },
                {
                    { "<Leader>d", group = "DAP" },
                    { "<Leader>df", group = "FZF" },
                },
                { "<Leader>f", group = "FZF" },
                { "<Leader>g", group = "Git" },
                {
                    { "<Leader>i", group = "Installers" },
                    { "<Leader>il", "<Cmd>Lazy<CR>", desc = "Plugin Manager" },
                    { "<Leader>im", "<Cmd>Mason<CR>", desc = "LSP Installer" },
                },
                { "<Leader>j", group = "Molten" },
                {
                    { "<Leader>l", group = "LSP" },
                    { "<Leader>lI", "<Cmd>LspInfo<CR>", desc = "LSP Info" },
                    { "<Leader>lf", desc = "FZF" },
                },
                { "<Leader>m", group = "Harpoon" },
                { "<Leader>r", group = "Sniprun" },
                { "<Leader>q", group = "Quickfix" },

                { "<Leader>c", group = "Copilot", mode = "v" },
                { "<Leader>j", group = "Molten", mode = "v" },
                { "<Leader>r", group = "Sniprun", mode = "v" },
            })
        end,
    },
}
