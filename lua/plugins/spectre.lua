return {
    {
        "nvim-pack/nvim-spectre",
        dependencies = "nvim-lua/plenary.nvim",
        cmd = "Spectre",
        opts = {
            open_cmd = "noswapfile vnew",
            live_update = true,
        },
        -- stylua: ignore
        keys = {
            { "<D-f>", "<Cmd>Spectre<CR>", desc = "Replace in Files" },
            { "<Leader>s", "<Cmd>Spectre<CR>", desc = "Replace in Files" },
        },
    },
}
