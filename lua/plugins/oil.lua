return {
    {
        "stevearc/oil.nvim",
        cmd = "Oil",
        dependencies = "nvim-tree/nvim-web-devicons",
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
                ["<C-c>"] = false,
                ["q"] = "actions.close",
            },
        },
    },
}
