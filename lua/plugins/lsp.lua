return {
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        ft = "markdown", -- Fix for jupytext
        cmd = "Mason",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "saghen/blink.cmp",
        },
        config = function()
            vim.lsp.set_log_level("off")

            local servers = {}

            if vim.g.install then
                servers = {
                    bashls = {},
                    clangd = {},
                    jdtls = {},
                    lua_ls = {},
                    basedpyright = {},
                    rust_analyzer = {},
                    tsserver = {},
                }
            end

            -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            capabilities.offsetEncoding = { "utf-16" }

            if require("jit").os == "Linux" and require("jit").arch == "arm64" then
                require("lspconfig").clangd.setup({ capabilities = capabilities })
            end

            -- Setup mason so it can manage external tooling
            require("mason").setup()

            -- Ensure the servers above are installed
            local mason_lspconfig = require("mason-lspconfig")

            mason_lspconfig.setup({
                ensure_installed = vim.tbl_keys(servers),
                handlers = {
                    function(server_name)
                        if server_name == "tsserver" then
                            server_name = "ts_ls"
                        end
                        if server_name ~= "jdtls" then
                            require("lspconfig")[server_name].setup({
                                capabilities = capabilities,
                                settings = servers[server_name],
                                on_attach = function(client)
                                    client.server_capabilities.documentFormattingProvider = false
                                    client.server_capabilities.documentRangeFormattingProvider =
                                        false
                                end,
                            })
                        end
                    end,
                },
            })

            vim.fn.sign_define(
                "DiagnosticSignError",
                { text = " ", texthl = "DiagnosticSignError", numhl = "DiagnosticSignError" }
            )
            vim.fn.sign_define(
                "DiagnosticSignWarn",
                { text = " ", texthl = "DiagnosticSignWarn", numhl = "DiagnosticSignWarn" }
            )
            vim.fn.sign_define(
                "DiagnosticSignHint",
                { text = "󰌶 ", texthl = "DiagnosticSignHint", numhl = "DiagnosticSignHint" }
            )
            vim.fn.sign_define(
                "DiagnosticSignInfo",
                { text = " ", texthl = "DiagnosticSignInfo", numhl = "DiagnosticSignInfo" }
            )

            -- stylua: ignore start
            local remap = vim.keymap.set
            remap("n", "<Leader>li", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, { desc = "Toggle Inlay Hints" })
            -- stylua: ignore end
        end,
    },

    {
        "nvimdev/lspsaga.nvim",
        cmd = "Lspsaga",
        -- stylua: ignore
        keys = {
            { "ga", "<Cmd>Lspsaga code_action<CR>", desc = "Show Code Actions" },
            { "gp", "<Cmd>Lspsaga goto_definition<CR>", desc = "Goto Definition" },
            { "gh", "<Cmd>Lspsaga hover_doc<CR>", desc = "Hover Documentation" },
            { "K", "<Cmd>Lspsaga hover_doc<CR>", desc = "Hover Documentation" },
            { "gr", "<Cmd>Lspsaga rename<CR>", desc = "Rename Variable" },
            { "gx", "<Cmd>Lspsaga finder<CR>", desc = "Find Reference" },

            { "[d", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Previous Diagnostic" },
            { "]d", "<Cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Next Diagnostic" },

            { "<Leader>lc", "<Cmd>Lspsaga code_action<CR>", desc = "Code Action" },
            { "<Leader>lh", "<Cmd>Lspsaga hover_doc<CR>", desc = "Hover Documentation" },
            { "<Leader>lp", "<Cmd>Lspsaga goto_definition<CR>", desc = "Goto Definition" },
            { "<Leader>lr", "<Cmd>Lspsaga rename<CR>", desc = "Rename Variable" },
            { "<Leader>lx", "<Cmd>Lspsaga finder<CR>", desc = "Find Reference" },
        },
        opts = {
            ui = {
                kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
            },
            finder = {
                keys = { toggle_or_open = "<CR>" },
            },
            rename = { in_select = false },
            lightbulb = { enable = false },
            symbol_in_winbar = { enable = false },
        },
    },

    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },

    {
        "mfussenegger/nvim-jdtls",
        ft = "java",
    },
}
