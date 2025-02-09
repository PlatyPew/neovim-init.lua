return {
    {
        "echasnovski/mini.basics",
        event = "VeryLazy",
        opts = {
            mappings = { windows = true },
        },
    },

    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            bufdelete = { enabled = true },
            dashboard = {
                enabled = true,
                preset = {
                    header = [[
         ▄▄                     ▄▄      
  ▄█▄   ▐█▌    ██     ▀█▄  ████████████▌
   ▀██  ▐█▌  ▄██        ▀   ▄▄▄▄██▄▄▄▄▄ 
     ▀  ▐█▌                ▐██  ██   █▌ 
 ▀▀▀▀▀██▀▀▀██▀▀▀▀▀   ▀▀▀█  ▐██▄▄██▄▄▄█▌ 
      █▌  ▐█▌          ▐█     ████ ▄▄   
     ██   ▐█▌          ▐█  ▄██  ▐█  ▀██▄
   ██▀    ▐█▌    ██    ▄██▄     ▐█      
▐██▀       ███████▀  ▀█▀  ▀▀▀▀█████████▀


   🚀 Moving At The Speed Of Light 🚀
 ]],
                },
                sections = {
                    { section = "header" },
                    { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
                    {
                        icon = " ",
                        title = "Recent Files",
                        section = "recent_files",
                        indent = 2,
                        padding = 1,
                    },
                    {
                        icon = " ",
                        title = "Projects",
                        section = "projects",
                        indent = 2,
                        padding = 1,
                    },
                    { section = "startup" },
                },
            },

            input = { enabled = true },
            notifier = { enabled = true, timeout = 3000 },
            picker = { enabled = false },
            quickfile = { enabled = true },
            rename = { enabled = true },
            scope = { enabled = true },
            terminal = { enabled = false },
        },
        -- stylua: ignore
        keys = {
            { "<leader>bq", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
            { "<leader>bD", function() Snacks.bufdelete.other() end, desc = "Delete All Other Buffers" },
            { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
            { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
            { "<Leader>t", function() Snacks.terminal() end, desc = "Toggle Terminal" },
        },
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
            keymaps = {
                close = { n = "q" },
            },
            engines = {
                ripgrep = {
                    placeholders = {
                        enabled = false,
                    },
                },
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
                { "<Leader>R", group = "Overseer" },
                { "<Leader>M", group = "Markdown" },
                { "<Leader>a", group = "Avante", mode = { "n", "v" } },
                { "<Leader>b", group = "Buffers" },
                {
                    { "<Leader>d", group = "DAP" },
                    { "<Leader>df", group = "FZF" },
                },
                { "<Leader>f", group = "FZF" },
                { "<Leader>g", group = "Git", mode = { "n", "v" } },
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
                { "<Leader>r", group = "Sniprun" },
                { "<Leader>q", group = "Quickfix" },

                { "<Leader>j", group = "Molten", mode = "v" },
                { "<Leader>r", group = "Sniprun", mode = "v" },
            })
        end,
    },
}
