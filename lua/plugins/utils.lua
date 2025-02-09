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
            picker = { enabled = true },
            quickfile = { enabled = true },
            rename = { enabled = true },
            scope = { enabled = true },
            terminal = { enabled = false },
        },
        -- stylua: ignore
        keys = {
            { "<leader>bq", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
            { "<leader>bQ", function() Snacks.bufdelete.other() end, desc = "Delete All Other Buffers" },
            { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
            { "<Leader>t", function() Snacks.terminal() end, desc = "Toggle Terminal" },

            { "<C-p>", function() Snacks.picker.smart() end, desc = "Fuzzy Find Files" },
            { "<Leader>ff", function() Snacks.picker.smart() end, desc = "Fuzzy Find Files" },
            { "<C-g>", function() Snacks.picker.grep() end, desc = "Fuzzy Grep Files" },
            { "<Leader>fr", function() Snacks.picker.grep() end, desc = "Fuzzy Grep Files" },
            { "<leader>f/", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
            { "<leader>fM", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
            { "<leader>fR", function() Snacks.picker.registers() end, desc = "Registers" },
            { "<leader>fc", function() Snacks.picker.command_history() end, desc = "Command History" },
            { "<leader>fm", function() Snacks.picker.marks() end, desc = "Marks" },
            { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
            { "<leader>fq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
            { "<leader>fs", function() Snacks.picker.spelling() end, desc = "Spell Suggest" },

            { "<leader>gl", function() Snacks.picker.git_log({ layout = "sidebar" }) end, desc = "Git Log" },
            { "<leader>gL", function() Snacks.picker.git_log_line({ layout = "sidebar" }) end, desc = "Git Log Line" },

            { "<leader>ld", function() Snacks.picker.diagnostics({ layout = "ivy" }) end, desc = "Diagnostics" },
            { "<leader>lD", function() Snacks.picker.diagnostics_buffer({ layout = "ivy" }) end, desc = "Buffer Diagnostics" },

            { "<Leader>u", function() Snacks.picker.undo({ layout = "sidebar" }) end, desc = "Undo History" },
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
                { "<Leader>d", group = "DAP" },
                { "<Leader>f", group = "Picker" },
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
                },
                { "<Leader>r", group = "Sniprun" },
                { "<Leader>q", group = "Quickfix" },

                { "<Leader>j", group = "Molten", mode = "v" },
                { "<Leader>r", group = "Sniprun", mode = "v" },
            })
        end,
    },
}
