return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = "nvim-lua/plenary.nvim",
        lazy = true,
        -- stylua: ignore
        keys = {
            { "mm", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon UI", },
            { "mh", function() require("harpoon"):list():add() end, desc = "Harpoon Add", },
            { "]m", function() require("harpoon"):list():prev() end, desc = "Harpoon Previous", },
            { "[m", function() require("harpoon"):list():next() end, desc = "Harpoon Next", },

            { "<Leader>hm", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon UI", },
            { "<Leader>hh", function() require("harpoon"):list():add() end, desc = "Harpoon Add", },
            { "<Leader>h]", function() require("harpoon"):list():prev() end, desc = "Harpoon Previous", },
            { "<Leader>h[", function() require("harpoon"):list():next() end, desc = "Harpoon Next", },
        },
        opts = {},
    },
}
