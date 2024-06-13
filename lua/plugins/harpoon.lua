return {
    {
        "ThePrimeagen/harpoon",
        dependencies = "nvim-lua/plenary.nvim",
        lazy = true,
        keys = {
            {
                "mm",
                function()
                    require("harpoon.ui").toggle_quick_menu()
                end,
            },
            {
                "mh",
                function()
                    require("harpoon.mark").add_file()
                end,
            },
            {
                "]m",
                function()
                    require("harpoon.ui").nav_next()
                end,
            },
            {
                "[m",
                function()
                    require("harpoon.ui").nav_prev()
                end,
            },
        },
    },
}
