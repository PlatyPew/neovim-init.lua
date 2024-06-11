local null_ls = require("null-ls")

require("mason-null-ls").setup({
    ensure_installed = { "clang_format", "prettier", "stylua", "yapf" },
    automatic_installation = true,
    automatic_setup = true,
    handlers = {
        clang_format = function()
            null_ls.register(null_ls.builtins.formatting.clang_format.with({
                extra_args = {
                    "--style",
                    "{IndentWidth: 4, PointerAlignment: Left, ColumnLimit: 100, AllowShortFunctionsOnASingleLine: Empty}",
                },
            }))
        end,
        prettier = function()
            null_ls.register(null_ls.builtins.formatting.prettier.with({
                extra_args = {
                    "--tab-width=4",
                    "--print-width=100",
                },
            }))
        end,
        stylua = function()
            null_ls.register(null_ls.builtins.formatting.stylua.with({
                extra_args = {
                    "--column-width=100",
                    "--indent-type=Spaces",
                },
            }))
        end,
        yapf = function()
            null_ls.register(null_ls.builtins.formatting.yapf.with({
                extra_args = {
                    "--style",
                    "{column_limit:100}",
                },
            }))
        end,
    },
})

local rustfmt = {
    method = null_ls.methods.FORMATTING,
    filetypes = { "rust" },
    generator = null_ls.generator({
        command = "rustfmt",
        args = { "--emit=stdout" },
        to_stdin = true,
        format = "raw",
        on_output = function(params, done)
            if params.output then
                done({
                    {
                        row = 1,
                        col = 1,
                        end_row = #params.content + 1,
                        end_col = 1,
                        text = params.output,
                    },
                })
            else
                done()
            end
        end,
    }),
}

null_ls.register(rustfmt)
