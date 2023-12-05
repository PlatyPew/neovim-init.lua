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
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("config.catppuccin")
        end,
    },

    {
        "norcalli/nvim-colorizer.lua",
        event = { "BufReadPost", "BufNewFile" },
        opts = {},
    },

    {
        "nvim-lualine/lualine.nvim",
        event = "UIEnter",
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
        dependencies = {
            "MunifTanjim/nui.nvim",
            { "stevearc/dressing.nvim", opts = {} },
        },
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
        "ibhagwan/fzf-lua",
        lazy = true,
        opts = {
            winopts = {
                preview = { scrollbar = false, wrap = "wrap" },
            },
        },
    },

    {
        "nvim-tree/nvim-tree.lua",
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
            view = { adaptive_size = true },
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
            "HiPhish/rainbow-delimiters.nvim",
        },
        config = function()
            require("config.treesitter")
        end,
    },

    {
        "altermo/ultimate-autopair.nvim",
        event = { "InsertEnter", "CmdlineEnter" },
        branch = "v0.6",
        opts = {},
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
        "nvimtools/none-ls.nvim",
        event = { "BufReadPost", "BufNewFile" },
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
        "kylechui/nvim-surround",
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
            },
            visual = "s",
        },
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
        keys = {
            { "<C-N>", "<Plug>(VM-Find-Under)" },
            { "<C-N>", "<Plug>(VM-Find-Subword-Under)", mode = "v" },
        },
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
            local buf_ft = vim.api.nvim_buf_get_name(0):match("[^/]+%.(.-)$")
            for _, value in ipairs(ft) do
                if value == buf_ft then
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
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
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
            snipruncolors = {
                SniprunVirtualTextOk = {
                    fg = vim.g.catppuccin_crust,
                    bg = vim.g.catppuccin_teal,
                },
            },
        },
    },

    {
        "lambdalisue/suda.vim",
        cmd = { "SudaWrite", "SudaRead" },
    },

    {
        "mattdibi/incolla.nvim",
        cmd = "Incolla",
        cond = function()
            return vim.fn.has("macunix")
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
        "ggandor/leap.nvim",
        keys = {
            { "s", "<Plug>(leap-forward)" },
            { "S", "<Plug>(leap-backward)" },
            { "gs", "<Plug>(leap-cross-window)" },
        },
        dependencies = { "tpope/vim-repeat" },
        config = function()
            require("leap").set_default_keymaps()
            vim.api.nvim_set_hl(0, "LeapLabelPrimary", {
                fg = vim.g.catppuccin_crust,
                bg = vim.g.catppuccin_red,
            })
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
        opts = { trim = false, silent = true },
    },

    {
        "christoomey/vim-tmux-navigator",
        event = "VeryLazy",
    },

    {
        "stevearc/oil.nvim",
        cmd = "Oil",
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
        "Zeioth/compiler.nvim",
        cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
        dependencies = {
            "stevearc/overseer.nvim",
            "nvim-telescope/telescope.nvim",
        },
        opts = {},
    },

    {
        "stevearc/overseer.nvim",
        commit = "400e762648b70397d0d315e5acaf0ff3597f2d8b",
        lazy = true,
        opts = {
            task_list = {
                direction = "bottom",
                min_height = 25,
                max_height = 25,
                default_detail = 1,
            },
        },
    },
})
