return {
    {
        "ggandor/leap.nvim",
        -- stylua: ignore
        keys = {
            { "s", "<Plug>(leap)" },
            { "S", "<Plug>(leap-cross-window)" },
            { "S", "<Plug>(leap)", mode = { "x", "o" } },
        },
        dependencies = { "tpope/vim-repeat" },
        config = function()
            require("leap").set_default_keymaps()

            local hl = vim.api.nvim_set_hl
            hl(0, "LeapLabelPrimary", {
                fg = vim.g.palette.crust,
                bg = vim.g.palette.red,
            })
            hl(0, "LeapBackdrop", { link = "Comment" })
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
            {"<M-j>", function() MiniMove.move_line("down") end, desc = "Move Line Down"},
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
        "echasnovski/mini.jump",
        keys = { "f", "F", "t", "T" },
        opts = {
            mappings = {
                repeat_jump = "",
            },
        },
    },

    {
        "echasnovski/mini.splitjoin",
        keys = {
            { "gS", desc = "Toggle Split Join", move = { "n", "x" } },
        },
        opts = {},
    },
}
