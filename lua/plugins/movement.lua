return {
    {
        "ggandor/leap.nvim",
        -- stylua: ignore
        keys = {
            {
                "s",
                function()
                    require("leap").leap({ target_windows = require("leap.user").get_focusable_windows() })
                end,
            },
            { "s", "<Plug>(leap)", mode = { "x", "o" } },
        },
        dependencies = { "tpope/vim-repeat" },
        opts = {
            equivalence_classes = { " \t\r\n" },
        },
        config = function(_, opts)
            require("leap").setup(opts)
            require("leap.user").set_repeat_keys("<enter>", "<s-enter>")
        end,
    },

    {
        "chrisgrieser/nvim-spider",
        -- stylua: ignore
        keys = {
            {"w", function() require("spider").motion("w") end, mode = { "n", "o", "x" }},
            { "e", function() require("spider").motion("e") end, mode = { "n", "o", "x" } },
            { "b", function() require("spider").motion("b") end, mode = { "n", "o", "x" } },
            { "ge", function() require("spider").motion("ge") end, mode = { "n", "o", "x" } },
        },
    },

    {
        "echasnovski/mini.move",
        -- stylua: ignore
        keys = {
            { "<M-h>", function() MiniMove.move_line("left") end, desc = "Move Line Left" },
            { "<M-j>", function() MiniMove.move_line("down") end, desc = "Move Line Down" },
            { "<M-k>", function() MiniMove.move_line("up") end, desc = "Move Line Up" },
            { "<M-l>", function() MiniMove.move_line("right") end, desc = "Move Line Right" },
            { "H", function() MiniMove.move_selection("left") end, desc = "Move Left", mode = "x" },
            { "J", function() MiniMove.move_selection("down") end, desc = "Move Down", mode = "x" },
            { "K", function() MiniMove.move_selection("up") end, desc = "Move Up", mode = "x" },
            { "L", function() MiniMove.move_selection("right") end, desc = "Move Right", mode = "x" },
        },
        opts = {
            mappings = {
                left = "H",
                down = "J",
                up = "K",
                right = "L",
            },
        },
    },

    {
        "echasnovski/mini.bracketed",
        keys = { "[", "]" },
        opts = {
            diagnostic = { suffix = "" },
            file = { suffix = "" },
            indent = { suffix = "" },
            jump = { suffix = "" },
            location = { suffix = "" },
            undo = { suffix = "" },
            yank = { suffix = "" },
        },
    },

    {
        "echasnovski/mini.ai",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = "nvim-treesitter/nvim-treesitter-textobjects",
        config = function()
            local ai = require("mini.ai")
            local ts = ai.gen_spec.treesitter

            ai.setup({
                n_lines = 500,
                custom_textobjects = {
                    c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
                    f = ts({ a = "@function.outer", i = "@function.inner" }), -- function
                    o = ai.gen_spec.treesitter({ -- code block
                        a = { "@block.outer", "@conditional.outer", "@loop.outer" },
                        i = { "@block.inner", "@conditional.inner", "@loop.inner" },
                    }),
                    t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
                    d = { "%f[%d]%d+" }, -- digits
                    e = { -- words with case
                        {
                            "%u[%l%d]+%f[^%l%d]",
                            "%f[%S][%l%d]+%f[^%l%d]",
                            "%f[%P][%l%d]+%f[^%l%d]",
                            "^[%l%d]+%f[^%l%d]",
                        },
                        "^().*()$",
                    },
                    u = ai.gen_spec.function_call(),
                    U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }),
                },
            })
        end,
    },

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = "nvim-lua/plenary.nvim",
        lazy = true,
        -- stylua: ignore
        keys = {
            { "mm", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon UI", },
            { "mh", function() require("harpoon"):list():add() end, desc = "Harpoon Add", },
            { "]m", function() require("harpoon"):list():prev() end, desc = "Harpoon Previous", },
            { "[m", function() require("harpoon"):list():next() end, desc = "Harpoon Next", },

            { "<Leader>mm", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon UI", },
            { "<Leader>mh", function() require("harpoon"):list():add() end, desc = "Harpoon Add", },
            { "<Leader>m]", function() require("harpoon"):list():prev() end, desc = "Harpoon Previous", },
            { "<Leader>m[", function() require("harpoon"):list():next() end, desc = "Harpoon Next", },
        },
        opts = {},
    },

    {
        "christoomey/vim-tmux-navigator",
        event = "VeryLazy",
    },

    {
        "m4xshen/hardtime.nvim",
        dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
        cond = function()
            return vim.fn.expand("$USER") == "daryllim"
        end,
        opts = {
            enabled = false,
            max_count = 5,
            max_time = 1000,
            disable_mouse = false,
            disabled_keys = {
                ["<Up>"] = {},
                ["<Down>"] = {},
                ["<Left>"] = {},
                ["<Right>"] = {},
            },
            disabled_filetypes = {
                "qf",
                "lazy",
                "mason",
                "oil",
                "dashboard",
                "dbui",
                "gitsigns.blame",
                "copilot-chat",
                "OverseerList",
                "sagafinder",
                "grug-far",
                "molten_output",
            },
        },
    },
}
