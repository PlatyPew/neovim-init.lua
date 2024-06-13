return {
    {
        "altermo/ultimate-autopair.nvim",
        event = { "InsertEnter", "CmdlineEnter" },
        branch = "v0.6",
        opts = {},
    },

    {
        "machakann/vim-highlightedyank",
        event = "VeryLazy",
        config = function()
            vim.api.nvim_set_hl(0, "HighlightedyankRegion", { reverse = true })
            vim.g.highlightedyank_highlight_duration = 200
        end,
    },

    {
        "mg979/vim-visual-multi",
        keys = {
            { "<C-N>", "<Plug>(VM-Find-Under)" },
            { "<C-N>", "<Plug>(VM-Find-Subword-Under)", mode = "v" },
        },
    },

    {
        "KeitaNakamura/tex-conceal.vim",
        ft = "tex",
        config = function()
            vim.g.tex_flavor = "latex"
            vim.g.tex_conceal = "abdgm"
            vim.g.tex_conceal_frac = 1
            vim.api.nvim_set_hl(0, "Conceal", {})
        end,
    },

    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
    },

    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },

    {
        "lambdalisue/suda.vim",
        cmd = { "SudaWrite", "SudaRead" },
    },

    {
        "mattdibi/incolla.nvim",
        cmd = "Incolla",
        cond = function()
            return vim.fn.has("macunix") == 1
        end,
        opts = {
            defaults = {
                img_dir = "img",
                img_name = function()
                    return os.date("%Y-%m-%d-%H-%M-%S")
                end,
                affix = "%s",
            },
            markdown = { affix = "![](%s)" },
        },
    },

    {
        "ThePrimeagen/harpoon",
        lazy = true,
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
        "ojroques/nvim-osc52",
        lazy = true,
        opts = { trim = false, silent = true },
    },

    {
        "christoomey/vim-tmux-navigator",
        event = "VeryLazy",
    },

    {
        "chrisgrieser/nvim-spider",
        keys = {
            { "w", "<Cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
            { "e", "<Cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
            { "b", "<Cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
            { "ge", "<Cmd>lua require('spider').motion('ge')<CR>", mode = { "n", "o", "x" } },
        },
    },

    {
        "kkoomen/vim-doge",
        build = ":call doge#install()",
        cmd = { "DogeGenerate" },
    },
}
