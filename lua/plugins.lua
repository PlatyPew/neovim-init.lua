local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

return require("lazy").setup({
    {
        "catppuccin/nvim",
        name = "catppuccino",
        tag = "v0.1",
        priority = 1000,
        config = function()
            require("config.catppuccino")
        end,
    },

    {
        "norcalli/nvim-colorizer.lua",
        event = { "BufReadPost", "BufNewFile" },
        opts = {},
    },

    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        config = function()
            require("config.lualine")
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = { long_message_to_split = true },
        },
        dependencies = { "MunifTanjim/nui.nvim" },
    },

    {
        "nvimdev/dashboard-nvim",
        commit = "a36b3232c98616149784f2ca2654e77caea7a522",
        event = "VimEnter",
        cmd = "Dashboard",
        config = function()
            require("config.dashboard")
        end,
        cond = function()
            return vim.api.nvim_buf_get_name(0) == ""
        end,
    },

    {
        "XenoPhex/fzf-lua",
        branch = "fix-icons",
        lazy = true,
        opts = {
            winopts = {
                preview = { scrollbar = false, wrap = "wrap" },
            },
        },
    },

    {
        "kyazdani42/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        opts = {
            disable_netrw = true,
            hijack_cursor = true,
            update_cwd = true,
            actions = {
                change_dir = { global = true },
            },
            filesystem_watchers = { enable = true },
            renderer = {
                indent_markers = { enable = true },
                icons = {
                    show = { folder_arrow = false },
                },
            },
        },
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
        -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/nvim-treesitter-refactor",
            "p00f/nvim-ts-rainbow",
        },
        config = function()
            require("config.treesitter")
        end,
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("config.autopair")
        end,
    },

    {
        "windwp/nvim-ts-autotag",
        ft = { "html", "javascriptreact", "typescriptreact" },
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
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("config.gitsigns")
        end,
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
        -- LSP Configuration & Plugins
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            "folke/neodev.nvim",
        },
        config = function()
            require("config.lsp")
        end,
    },

    {
        "nvimdev/lspsaga.nvim",
        cmd = "Lspsaga",
        opts = {
            finder = {
                keys = { expand_or_jump = "<CR>" },
            },
            lightbulb = { enable = false },
            symbol_in_winbar = { enable = false },
        },
    },

    {
        -- Autocompletion
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "onsails/lspkind.nvim",

            -- Snippets
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",

            -- Extra sources
            "FelipeLema/cmp-async-path",
            "ray-x/cmp-treesitter",
            "hrsh7th/cmp-buffer",
        },
        config = function()
            require("config.cmp")
        end,
    },

    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        opts = {
            suggestion = {
                auto_trigger = true,
                keymap = {
                    accept = "<A-CR>",
                    accept_word = false,
                    accept_line = false,
                    next = "<A-Tab>",
                    prev = "<A-S-Tab>",
                    dismiss = "<A-[>",
                },
            },
        },
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "LspAttach",
        dependencies = {
            "williamboman/mason.nvim",
            "jay-babu/mason-null-ls.nvim",
        },
        config = function()
            require("config.nullls")
        end,
    },

    {
        -- NOTE: Yes, you can install new plugins here!
        "rcarriga/nvim-dap-ui",
        lazy = true,
        -- NOTE: And you can specify dependencies as well
        dependencies = {
            "mfussenegger/nvim-dap",
            -- Creates a beautiful debugger UI
            "theHamsta/nvim-dap-virtual-text",

            -- Installs the debug adapters for you
            "williamboman/mason.nvim",
            "jay-babu/mason-nvim-dap.nvim",

            -- Add your own debuggers here
            --[[ "mfussenegger/nvim-jdtls", ]]
        },
        config = function()
            require("config.dap")
        end,
    },

    {
        "anyakichi/vim-surround",
        keys = {
            { "ys", "<Plug>Ysurround" },
            { "ygs", "<Plug>Ygsurround" },
            { "cs", "<Plug>Csurround" },
            { "ds", "<Plug>Dsurround" },
            { "s", "<Plug>Vsurround", mode = "v" },
        },
        dependencies = { "tpope/vim-repeat" },
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("config.whichkey")
        end,
    },

    {
        "mg979/vim-visual-multi",
        keys = { "<C-N>", "<Plug>(VM-Find-Under)" },
    },

    {
        "numToStr/Comment.nvim",
        keys = {
            { "gcc", "<Plug>(comment_toggle_linewise_current)" },
            { "gc", "<Plug>(comment_toggle_linewise_current)", mode = "v" },
            { "gb", "<Plug>(comment_toggle_blockwise_current)", mode = "v" },
        },
        config = function()
            require("config.comment")
        end,
        dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
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
        "jbyuki/instant.nvim",
        cmd = { "InstantStartServer", "InstantJoinSession" },
        config = function()
            vim.g.instant_username = io.popen("whoami"):read("*a"):sub(0, -2)
        end,
    },

    {
        "mattn/emmet-vim",
        event = "InsertEnter",
        cond = function()
            local ft = { "html", "css", "markdown", "javascriptreact", "typescriptreact" }
            for _, value in ipairs(ft) do
                if value == vim.bo.filetype then
                    return true
                end
            end
            return false
        end,
    },

    { "mbbill/undotree", cmd = "UndotreeToggle" },

    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        build = "cd app && npm install",
    },

    {
        "michaelb/sniprun",
        build = "bash ./install.sh",
        keys = {
            "<Plug>SnipReplMemoryClean",
            "<Plug>SnipReset",
            "<Plug>SnipClose",
            "<Plug>SnipInfo",
            "<Plug>SnipRun",
            "<Plug>SnipTerminate",
        },
        opts = {
            snipruncolors = { SniprunVirtualTextOk = { bg = "#b1e3ad", fg = "#000000" } },
        },
    },

    {
        "lambdalisue/suda.vim",
        cmd = { "SudaWrite", "SudaRead" },
    },

    {
        "ggandor/leap.nvim",
        keys = {
            { "s", "<Plug>(leap-forward)" },
            { "S", "<Plug>(leap-backward)" },
            { "gs", "<Plug>(leap-cross-window)" },
        },
        dependencies = { "tpope/vim-repeat" },
        config = function()
            require("leap").set_default_keymaps()
            vim.api.nvim_set_hl(0, "LeapLabelPrimary", { fg = "Black", bg = "#cf637e" })
        end,
    },

    {
        "ThePrimeagen/harpoon",
        lazy = true,
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
        "ojroques/nvim-osc52",
        lazy = true,
        opts = { trim = true, silent = true },
    },
})
