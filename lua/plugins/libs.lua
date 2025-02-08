return {
    {
        "echasnovski/mini.icons",
        lazy = true,
        specs = {
            { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
        },
        init = function()
            package.preload["nvim-web-devicons"] = function()
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end
        end,
        config = true,
    },

    {
        "nvim-lua/plenary.nvim",
        lazy = true,
    },

    {
        "MunifTanjim/nui.nvim",
        lazy = true,
    },

    {
        "stevearc/dressing.nvim",
        lazy = true,
        config = true,
    }
}
