return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeoutlen = 500
    end,
    opts = {
        ignore_missing = true,
        window = {
            border = "double",
        },
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)

        wk.register({
            R = { name = "Overseer" },
            c = { name = "Copilot" },
            d = { name = "DAP", f = { name = "FZF" } },
            f = { name = "FZF" },
            g = { name = "Git" },
            i = {
                name = "Installers",
                l = { "<Cmd>Lazy<CR>", "Plugin Manager" },
                m = { "<Cmd>Mason<CR>", "LSP Installer" },
            },
            h = { name = "Harpoon" },
            l = {
                name = "LSP",
                I = { "<Cmd>LspInfo<CR>", "LSP Info" },
                f = { name = "FZF" },
            },
            r = { name = "Sniprun" },
        }, { mode = "n", prefix = "<Leader>" })

        wk.register({
            c = {
                name = "Copilot",
            },
            s = {
                name = "Git",
            },
            r = {
                name = "Sniprun",
            },
        }, { mode = "v", prefix = "<Leader>" })
    end,
}
