return {
    {
        "stevearc/oil.nvim",
        lazy = true,
        cmd = "Oil",
        -- stylua: ignore
        keys = {
            { "<Leader>o", '<Cmd>lua require("oil").toggle_float()<CR>', desc = "File Explorer" },
        },
        init = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
        end,
        opts = {
            default_file_explorer = true,
            delete_to_trash = true,
            skip_confirm_for_simple_edits = true,
            view_options = {
                show_hidden = true,
                is_always_hidden = function(name, _)
                    return name == ".."
                end,
            },
            float = {
                padding = 2,
                max_width = 90,
                max_height = 0,
            },
            win_options = {
                wrap = true,
                winblend = 0,
            },
            keymaps = {
                ["<BS>"] = "actions.parent",
                ["<C-c>"] = false,
                ["q"] = "actions.close",
            },
        },
    },
}
