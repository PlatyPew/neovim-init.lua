return {
    {
        "kylechui/nvim-surround",
        -- stylua: ignore
        keys = {
            { "ys", "<Plug>(nvim-surround-normal)" },
            { "cs", "<Plug>(nvim-surround-change)" },
            { "ds", "<Plug>(nvim-surround-delete)" },
            { "s", "<Plug>(nvim-surround-visual)", mode = { "x", "o" } },
        },
        opts = {
            surrounds = {
                ["("] = { add = { "(", ")" } },
                [")"] = { add = { "( ", " )" } },
                ["["] = { add = { "[", "]" } },
                ["]"] = { add = { "[ ", " ]" } },
                ["{"] = { add = { "{", "}" } },
                ["}"] = { add = { "{ ", " }" } },
                ["<"] = { add = { "<", ">" } },
                [">"] = { add = { "< ", " >" } },
            },
            keymaps = {
                -- visual_line = "",
                visual = "s",
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

    {
        "mg979/vim-visual-multi",
        -- stylua: ignore
        keys = {
            { "<C-N>", "<Plug>(VM-Find-Under)" },
            { "<C-N>", "<Plug>(VM-Find-Subword-Under)", mode = "v" },
        },
    },
}
