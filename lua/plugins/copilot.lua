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
            {
                "<Leader>cc",
                "<Cmd>CopilotChatToggle<CR>",
                desc = "Toggle Copilot Chat",
                mode = "v",
            },
            { "<Leader>cD", "<Cmd>CopilotChatDocs<CR>", desc = "Copilot Chat Docs", mode = "v" },
            { "<Leader>cT", "<Cmd>CopilotChatTests<CR>", desc = "Copilot Chat Tests", mode = "v" },
            {
                "<Leader>cd",
                "<Cmd>CopilotChatFixDiagnostic<CR>",
                desc = "Copilot Chat Fix Diagnostics",
                mode = "v",
            },
            {
                "<Leader>ce",
                "<Cmd>CopilotChatExplain<CR>",
                desc = "Copilot Chat Explain",
                mode = "v",
            },
            { "<Leader>cf", "<Cmd>CopilotChatFix<CR>", desc = "Copilot Chat Fix", mode = "v" },
            {
                "<Leader>co",
                "<Cmd>CopilotChatOptimize<CR>",
                desc = "Copilot Chat Optimise",
                mode = "v",
            },
            {
                "<Leader>cr",
                "<Cmd>CopilotChatReview<CR>",
                desc = "Copilot Chat Review",
                mode = "v",
            },
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
