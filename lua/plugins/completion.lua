return {
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
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            require("luasnip.loaders.from_vscode").lazy_load()
            require("copilot_cmp").setup()

            local border_opts = {
                border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
            }

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete({}),
                    ["<CR>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false,
                    }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                formatting = {
                    format = require("lspkind").cmp_format({
                        mode = "symbol_text",
                        maxwidth = 50,
                        ellipsis_char = "...",
                        menu = {
                            nvim_lsp = "[LSP]",
                            async_path = "[PATH]",
                            treesitter = "[TS]",
                            buffer = "[BUF]",
                            luasnip = "[SNIP]",
                            copilot = "[COPILOT]",
                        },
                        symbol_map = {
                            String = "󰊄",
                            Comment = "󰅺",
                            Copilot = "",
                        },
                    }),
                },
                window = {
                    completion = cmp.config.window.bordered(border_opts),
                    documentation = cmp.config.window.bordered(border_opts),
                },
                sources = {
                    { name = "copilot" },
                    { name = "nvim_lsp" },
                    { name = "async_path" },
                    { name = "treesitter" },
                    { name = "buffer" },
                    { name = "luasnip" },
                },
                sorting = {
                    comparators = {
                        require("copilot_cmp.comparators").prioritize,

                        cmp.config.compare.offset,
                        cmp.config.compare.exact,
                        cmp.config.compare.score,
                        cmp.config.compare.recently_used,
                        cmp.config.compare.kind,
                    },
                },
            })
        end,
    },

    {
        "zbirenbaum/copilot-cmp",
        lazy = true,
    },
}
