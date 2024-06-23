return {
    {
        "nvim-pack/nvim-spectre",
        build = false,
        cmd = "Spectre",
        opts = { open_cmd = "noswapfile vnew" },
        -- stylua: ignore
        keys = {
            { "<D-f>", "<Cmd>Spectre<CR>", desc = "Replace in Files" },
            { "<Leader>s", "<Cmd>Spectre<CR>", desc = "Replace in Files" },
        },
    },
}
