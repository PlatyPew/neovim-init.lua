return {
    {
        "ThePrimeagen/harpoon",
        dependencies = "nvim-lua/plenary.nvim",
        lazy = true,
        keys = {
            { "mm", function() require("harpoon.ui").toggle_quick_menu() end },
            { "mh", function() require("harpoon.mark").add_file() end },
            { "]m", function() require("harpoon.ui").nav_next() end },
            { "[m", function() require("harpoon.ui").nav_prev() end },

            { "<Leader>mm", function() require("harpoon.ui").toggle_quick_menu() end },
            { "<Leader>mh", function() require("harpoon.mark").add_file() end },
            { "<Leader>m]", function() require("harpoon.ui").nav_next() end },
            { "<Leader>m[", function() require("harpoon.ui").nav_prev() end },
        },
    },
}
