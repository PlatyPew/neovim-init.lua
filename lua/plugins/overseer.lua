return {
    {
        "stevearc/overseer.nvim",
        cmd = {
            "OverseerOpen",
            "OverseerClose",
            "OverseerToggle",
            "OverseerSaveBundle",
            "OverseerLoadBundle",
            "OverseerDeleteBundle",
            "OverseerRunCmd",
            "OverseerRun",
            "OverseerInfo",
            "OverseerBuild",
            "OverseerQuickAction",
            "OverseerTaskAction",
            "OverseerClearCache",
        },
        -- stylua: ignore
        keys = {
            { "<Leader>RO", "<Cmd>OverseerToggle right<CR>", desc = "Toggles overseer window" },
            { "<Leader>RR", "<Cmd>OverseerRun<CR>", desc = "Run builtin" },
            { "<Leader>Rr", "<Cmd>OverseerRunCmd<CR>", desc = "Run command" },
        },
        opts = { dap = false },
    },
}
