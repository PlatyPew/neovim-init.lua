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

    {
        "michaelb/sniprun",
        build = "bash ./install.sh",
        cmd = { "SnipRun", "SnipInfo" },
        -- stylua: ignore
        keys = {
            --[[ { "<Leader>r", "<Plug>SnipRunOperator" }, ]]
            { "<Leader>rc", "<Plug>SnipReset", desc = "Reset SnipRun" },
            { "<Leader>rq", "<Plug>SnipClose", desc = "Close SnipRun" },
            { "<Leader>rr", "<Plug>SnipRun", desc = "Run Code", mode = { "n", "v" } },
        },
        config = function()
            require("sniprun").setup({
                display = { "TerminalWithCode", "VirtualTextOk", "Api" },
                selected_interpreters = { "Python3_fifo", "JS_TS_deno" },
                repl_enable = { "Python3_fifo", "JS_TS_deno" },
                snipruncolors = {
                    SniprunVirtualTextOk = {
                        fg = vim.g.palette.crust,
                        bg = vim.g.palette.teal,
                    },
                },
            })

            local api_listener = function(d)
                if vim.bo.filetype ~= "markdown" then
                    return
                end

                if d.status ~= "ok" or d.message == "" then
                    return
                end

                local output = string.format("```plain\n%s\n```\n", d.message)
                vim.fn.setreg('"', output)
            end

            require("sniprun.api").register_listener(api_listener)
        end,
    },

    {
        "mistweaverco/kulala.nvim",
        ft = "http",
        init = function()
            vim.filetype.add({
                extension = {
                    ["http"] = "http",
                },
            })
        end,
        opts = {},
    },
}
