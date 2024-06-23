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

    {
        "mattn/emmet-vim",
        -- stylua: ignore
        keys = {
            { "<C-Y>,", "<Plug>(emmet-expand-abbr)", mode = { "i", "n", "v" } },
            { "<C-Y>/", "<Plug>(emmet-toggle-comment)", mode = { "i", "n" } },
            { "<C-Y>;", "<Plug>(emmet-expand-word)", mode = { "i", "n" } },
            { "<C-Y>D", "<Plug>(emmet-balance-tag-outword)", mode = { "i", "n", "v" } },
            { "<C-Y>I", "<Plug>(emmet-image-encode)", mode = { "i", "n" } },
            { "<C-Y>a", "<Plug>(emmet-anchorize-url)", mode = { "i", "n" } },
            { "<C-Y>d", "<Plug>(emmet-balance-tag-inward)", mode = { "i", "n", "v" } },
            { "<C-Y>i", "<Plug>(emmet-image-size)", mode = { "i", "n" } },
            { "<C-Y>j", "<Plug>(emmet-split-join-tag)", mode = { "i", "n" } },
            { "<C-Y>k", "<Plug>(emmet-merge-lines)", mode = { "i", "n" } },
            { "<C-Y>k", "<Plug>(emmet-remove-tag)", mode = { "i", "n" } },
            { "<C-Y>u", "<Plug>(emmet-update-tag)", mode = { "i", "n" } },
        },
    },

    {
        "altermo/ultimate-autopair.nvim",
        event = { "InsertEnter", "CmdlineEnter" },
        branch = "v0.6",
        opts = {},
    },
}
