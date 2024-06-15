return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        keys = {
            { "<Leader>ct", "<Cmd>Copilot toggle<CR>", desc = "Toggle Copilot" },
            { "<Leader>cp", "<Cmd>Copilot panel<CR>", desc = "Copilot Panel" },
            { "<Leader>cs", "<Cmd>Copilot status<CR>", desc = "Copilot Status" },
        },
        opts = {
            suggestion = {
                auto_trigger = true,
                keymap = {
                    accept = "<M-CR>",
                    accept_word = false,
                    accept_line = false,
                },
            },
        },
    },

    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        cmd = {
            "CopilotChat",
            "CopilotChatToggle",
            "CopilotChatExplain",
            "CopilotChatReview",
            "CopilotChatFix",
            "CopilotChatOptimize",
            "CopilotChatDocs",
            "CopilotChatTests",
            "CopilotChatFixDiagnostic",
        },
        keys = {
            { "<Leader>cc", "<Cmd>CopilotChatToggle<CR>", desc = "Toggle Copilot Chat" },
        },
        dependencies = {
            "zbirenbaum/copilot.lua",
            "nvim-lua/plenary.nvim",
        },
        opts = {
            temperature = 0.2,
            window = {
                layout = "float",
            },
        },
    },
}
