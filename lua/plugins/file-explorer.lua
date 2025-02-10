return {
    {
        "echasnovski/mini.files",
        keys = {
            {
                "<Leader>o",
                function()
                    MiniFiles.open()
                end,
                desc = "File Explorer",
            },
        },
        init = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
        end,
        config = true,
    },

    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            picker = { enabled = true },
        },
        -- stylua: ignore
        keys = {
            { "<C-p>", function() Snacks.picker.smart() end, desc = "Fuzzy Find Files" },
            { "<Leader>ff", function() Snacks.picker.smart() end, desc = "Fuzzy Find Files" },
            { "<C-g>", function() Snacks.picker.grep() end, desc = "Fuzzy Grep Files" },
            { "<Leader>fr", function() Snacks.picker.grep() end, desc = "Fuzzy Grep Files" },
            { "<leader>f/", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
            { "<leader>fM", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
            { "<leader>fR", function() Snacks.picker.registers() end, desc = "Registers" },
            { "<leader>fc", function() Snacks.picker.command_history() end, desc = "Command History" },
            { "<leader>fm", function() Snacks.picker.marks() end, desc = "Marks" },
            { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
            { "<leader>fq", function() Snacks.picker.qflist({ layout = "ivy" }) end, desc = "Quickfix List" },
            { "<leader>fs", function() Snacks.picker.spelling() end, desc = "Spell Suggest" },

            { "<leader>gl", function() Snacks.picker.git_log({ layout = "sidebar" }) end, desc = "Git Log" },
            { "<leader>gL", function() Snacks.picker.git_log_line({ layout = "sidebar" }) end, desc = "Git Log Line" },

            { "<leader>ld", function() Snacks.picker.diagnostics({ layout = "ivy" }) end, desc = "Diagnostics" },
            { "<leader>lD", function() Snacks.picker.diagnostics_buffer({ layout = "ivy" }) end, desc = "Buffer Diagnostics" },

            { "<Leader>u", function() Snacks.picker.undo({ layout = "sidebar" }) end, desc = "Undo History" },
        }
,
    },
}
