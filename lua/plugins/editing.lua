return {
    {
        "kylechui/nvim-surround",
        -- stylua: ignore
        keys = {
            { "ys", "<Plug>(nvim-surround-normal)" },
            { "cs", "<Plug>(nvim-surround-change)" },
            { "ds", "<Plug>(nvim-surround-delete)" },
            { "s", "<Plug>(nvim-surround-visual)", mode = "v" },
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
        config = true,
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
        config = true,
    },

    {
        "numToStr/Comment.nvim",
        dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
        lazy = true,
        init = function()
            function _G.__toggle_contextual(vmode)
                local cfg = require("Comment.config"):get()
                local U = require("Comment.utils")
                local Op = require("Comment.opfunc")
                local range = U.get_region(vmode)
                local same_line = range.srow == range.erow

                local ctx = {
                    cmode = U.cmode.toggle,
                    range = range,
                    cmotion = U.cmotion[vmode] or U.cmotion.line,
                    ctype = same_line and U.ctype.linewise or U.ctype.blockwise,
                }

                local lcs, rcs = U.parse_cstr(cfg, ctx)
                local lines = U.get_lines(range)

                local params = {
                    range = range,
                    lines = lines,
                    cfg = cfg,
                    cmode = ctx.cmode,
                    lcs = lcs,
                    rcs = rcs,
                }

                if same_line then
                    Op.linewise(params)
                else
                    Op.blockwise(params)
                end
            end
        end,
        config = function()
            require("Comment").setup({
                mappings = {
                    basic = false,
                },
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
            })
        end,
    },

    {
        "monaqa/dial.nvim",
        -- stylua: ignore
        keys = {
            { "<C-a>", function() require("dial.map").manipulate("increment", "normal") end, mode = "n" },
            { "<C-x>", function() require("dial.map").manipulate("decrement", "normal") end, mode = "n" },
            { "g<C-a>", function() require("dial.map").manipulate("increment", "gvisual") end, mode = "v" },
            { "g<C-x>", function() require("dial.map").manipulate("decrement", "gvisual") end, mode = "v" },
        },
    },
}
