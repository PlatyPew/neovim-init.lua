vim.lsp.set_log_level("off")

local servers = {
    lua_ls = {},
    pyright = {},
    tsserver = {},
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
capabilities.offsetEncoding = { "utf-16" }

if require("jit").os == "Linux" and require("jit").arch == "arm64" then
    require("lspconfig").clangd.setup({
        capabilities = capabilities,
    })
else
    servers.clangd = {}
end

require("neodev").setup()

-- Setup mason so it can manage external tooling
require("mason").setup()

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
    ensure_installed = vim.tbl_keys(servers),
    handlers = {
        function(server_name)
            if server_name ~= "jdtls" then
                require("lspconfig")[server_name].setup({
                    capabilities = capabilities,
                    settings = servers[server_name],
                    on_attach = function(client)
                        client.server_capabilities.documentFormattingProvider = false
                        client.server_capabilities.documentRangeFormattingProvider = false
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
