return {
    {
        "rcarriga/nvim-dap-ui",
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

            require("mason-nvim-dap").setup({
                ensure_installed = {
                    "python",
                    "node2",
                    "codelldb",
                },
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
                dap.configurations[vim.bo.filetype][1].program =
                    vim.fn.input("Path: ", vim.fn.getcwd() .. "/", "file")
            end

            require("overseer").enable_dap()
        end,
    },
}
