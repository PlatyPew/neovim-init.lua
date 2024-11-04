return {
    {
        "Exafunction/codeium.nvim",
        event = "InsertEnter",
        cmd = { "Codeium" },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        opts = { enable_chat = true },
    },
}
