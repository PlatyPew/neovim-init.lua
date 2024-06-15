return {
    {
        "ibhagwan/fzf-lua",
        lazy = true,
        keys = {
            {
                "<C-p>",
                function()
                    require("fzf-lua").files({
                        cmd = [[ rg --files --hidden --no-ignore-vcs -g "!.git/*" ]],
                    })
                end,
                desc = "Fuzzy Find Files",
            },
            { "<C-g>", "<Cmd>FzfLua live_grep_native<CR>", desc = "Fuzzy Find Ripgrep" },

            { "<Leader>f/", "<Cmd>FzfLua blines<CR>", desc = "Current Buffer Lines" },
            { "<Leader>fM", "<Cmd>FzfLua keymaps<CR>", desc = "Mappings" },
            { "<Leader>fb", "<Cmd>FzfLua buffers<CR>", desc = "Buffers" },
            {
                "<Leader>ff",
                function()
                    require("fzf-lua").files({
                        cmd = [[ rg --files --hidden --no-ignore-vcs -g "!.git/*" ]],
                    })
                end,
                "Files",
            },
            { "<Leader>fh", "<Cmd>FzfLua command_history<CR>", desc = "Command History" },
            { "<Leader>fm", "<Cmd>FzfLua marks<CR>", desc = "Marks" },
            { "<Leader>fq", "<Cmd>FzfLua quickfix<CR>", desc = "Quickfix List" },
            { "<Leader>fr", "<Cmd>FzfLua live_grep_native<CR>", desc = "Ripgrep" },
            { "<Leader>fs", "<Cmd>FzfLua spell_suggest<CR>", desc = "Spell Suggest" },
        },
        opts = {
            winopts = {
                preview = { scrollbar = false, wrap = "wrap" },
            },
        },
    },
}
