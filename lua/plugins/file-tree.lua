return {
    {
        "nvim-tree/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        opts = {
            disable_netrw = true,
            hijack_cursor = true,
            update_cwd = true,
            actions = {
                change_dir = { global = true },
            },
            filesystem_watchers = { enable = true },
            renderer = {
                indent_markers = { enable = true },
                icons = {
                    show = { folder_arrow = false },
                },
            },
            view = { adaptive_size = true },
        },
        dependencies = "nvim-tree/nvim-web-devicons",
    },

    {
        "stevearc/oil.nvim",
        cmd = "Oil",
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
}
