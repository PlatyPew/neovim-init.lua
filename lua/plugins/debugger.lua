return {
    {
        "rcarriga/nvim-dap-ui",
        keys = {
            { "<Leader>du", "<Cmd>lua require'dapui'.toggle()<CR>", desc = "Toggle DAP UI" },
        },
        lazy = true,
        dependencies = {
            "mfussenegger/nvim-dap",
            "theHamsta/nvim-dap-virtual-text",
            "williamboman/mason.nvim",
            "jay-babu/mason-nvim-dap.nvim",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap = require("dap")

            vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "Conditional" })
            vim.fn.sign_define("DapStopped", { text = "", texthl = "String" })

            require("neodev").setup({
                library = { plugins = { "nvim-dap-ui" }, types = true },
            })

            local ensure_installed = {}
            if vim.g.install then
                ensure_installed = {
                    "python",
                    "node2",
                    "codelldb",
                    "java-debug-adapter",
                }
            end

            require("mason-nvim-dap").setup({
                ensure_installed = ensure_installed,
                automatic_setup = true,
                handlers = {},
            })

            require("nvim-dap-virtual-text").setup({})

            require("dapui").setup()

            dap.configurations.java = {
                {
                    name = "Debug Launch (2GB)",
                    type = "java",
                    request = "launch",
                    vmArgs = "" .. "-Xmx2g ",
                },
                {
                    name = "Debug Attach (8000)",
                    type = "java",
                    request = "attach",
                    hostName = "127.0.0.1",
                    port = 8000,
                },
                {
                    name = "Debug Attach (5005)",
                    type = "java",
                    request = "attach",
                    hostName = "127.0.0.1",
                    port = 5005,
                },
            }

            function _G.dap_args()
                local num = tonumber(vim.fn.input("Number of arguments: "))
                local t = {}
                for i = 1, num do
                    t[i] = vim.fn.input("Argument " .. i .. ": ")
                end

                dap.configurations[vim.bo.filetype][1].args = t
            end

            function _G.dap_program()
                require("fzf-lua").files({
                    cwd = vim.fn.getcwd(),
                    actions = {
                        ["default"] = function(selected_fzf_item)
                            dap.configurations[vim.bo.filetype][1].program = selected_fzf_item[1]:gsub("[^\32-\126]", ""):sub(2)
                        end,
                    },
                })
            end

            require("overseer").enable_dap()

            -- stylua: ignore start
            local remap = vim.keymap.set
            remap("n", "<F5>", "<Cmd>DapContinue<CR>", { desc = "Continue" })
            remap("n", "<F6>", "<Cmd>DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })
            remap("n", "<F10>", "<Cmd>DapStepOver<CR>", { desc = "Step Over" })
            remap("n", "<F11>", "<Cmd>DapStepInto<CR>", { desc = "Step Into" })
            remap("n", "<F12>", "<Cmd>DapStepOut<CR>", { desc = "Step Out" })

            remap("n", "<Leader>dC", "<Cmd>DapTerminate<CR>", { desc = "Close" })
            remap("n", "<Leader>dR", "<Cmd>DapToggleRepl<CR>", { desc = "REPL" })
            remap("n", "<Leader>dS", "<Cmd>DapStepInto<CR>", { desc = "Step Into" })
            remap("n", "<Leader>da", function() _G.dap_args() end, { desc = "Set Program Arguments" })
            remap("n", "<Leader>db", "<Cmd>DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })
            remap("n", "<Leader>dc", "<Cmd>DapContinue<CR>", { desc = "Continue" })
            remap("n", "<Leader>de", "<Cmd>DapEval<CR>", { desc = "Evaluate" })
            remap("n", "<Leader>dp", function() _G.dap_program() end, { desc = "Set Executable Path" })
            remap("n", "<Leader>do", "<Cmd>DapStepOut<CR>", { desc = "Step Out" })
            remap("n", "<Leader>ds", "<Cmd>DapStepOver<CR>", { desc = "Step Over" })
            remap("n", "<Leader>du", function() require("dapui").toggle() end, { desc = "Toggle DAP UI" })

            remap("n", "<Leader>dfb", "<Cmd>FzfLua dap_breakpoints<CR>", { desc = "Breakpoints" })
            remap("n", "<Leader>dfc", "<Cmd>FzfLua dap_configurations<CR>", { desc = "Configurations" })
            remap("n", "<Leader>dff", "<Cmd>FzfLua dap_frames<CR>", { desc = "Frames" })
            remap("n", "<Leader>dfv", "<Cmd>FzfLua dap_variables<CR>", { desc = "Variables" })
            -- stylua: ignore end
        end,
    },
}
