return {
    {
        "lambdalisue/suda.vim",
        cmd = { "SudaWrite", "SudaRead" },
        keys = {
            { "<Leader>W", "<Cmd>SudaWrite<CR>", desc = "Sudo Write" },
        },
        init = function()
            vim.api.nvim_create_user_command("W", "SudaWrite", {})
        end,
    },
}
