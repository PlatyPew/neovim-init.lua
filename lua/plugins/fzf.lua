return {
    {
        "ibhagwan/fzf-lua",
        lazy = true,
        cmd = "FzfLua",
        -- stylua: ignore
        keys = {
            { "<C-p>", "<Cmd>FzfLua files<CR>", desc = "Fuzzy Find Files" },
            { "<C-g>", "<Cmd>FzfLua live_grep_native<CR>", desc = "Fuzzy Find Ripgrep" },

            { "<Leader>f/", "<Cmd>FzfLua blines<CR>", desc = "Current Buffer Lines" },
            { "<Leader>fM", "<Cmd>FzfLua keymaps<CR>", desc = "Mappings" },
            { "<Leader>fR", "<Cmd>FzfLua registers<CR>", desc = "Registers" },
            { "<Leader>ff",  "<Cmd>FzfLua files<CR>", desc = "Files" },
            { "<Leader>fh", "<Cmd>FzfLua command_history<CR>", desc = "Command History" },
            { "<Leader>fm", "<Cmd>FzfLua marks<CR>", desc = "Marks" },
            { "<Leader>fq", "<Cmd>FzfLua quickfix<CR>", desc = "Quickfix List" },
            { "<Leader>fr", "<Cmd>FzfLua live_grep_native<CR>", desc = "Ripgrep" },
            { "<Leader>fs", "<Cmd>FzfLua spell_suggest<CR>", desc = "Spell Suggest" },
        },
        opts = {
            "default-title",
            winopts = {
                preview = { scrollbar = false, wrap = "wrap" },
            },
        },
    },
}
