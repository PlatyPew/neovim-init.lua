return {
    "michaelb/sniprun",
    build = "bash ./install.sh",
    -- stylua: ignore
    keys = {
        { "<Leader>rC", "<Plug>SnipReplMemoryClean", desc = "Clean REPL memory" },
        { "<Leader>rR", "<Plug>SnipReset", desc = "Reset SnipRun" },
        { "<Leader>rc", "<Plug>SnipClose", desc = "Close SnipRun" },
        { "<Leader>ri", "<Plug>SnipInfo", desc = "Get SnipRun Info" },
        { "<Leader>rr", "<Plug>SnipRun", desc = "Run Code" },
        { "<Leader>rt", "<Plug>SnipTerminate", desc = "Terminate SnipRun" },
        { "<Leader>rr", "<Plug>SnipRun", desc = "Run Code", mode = "v" },
    },
    config = function()
        require("sniprun").setup({
            display = { "TerminalWithCode", "VirtualTextOk" },
            selected_interpreters = { "Python3_fifo", "JS_TS_deno" },
            repl_enable = { "Python3_fifo", "JS_TS_deno" },
            snipruncolors = {
                SniprunVirtualTextOk = {
                    fg = vim.g.palette.crust,
                    bg = vim.g.palette.teal,
                },
            },
        })
    end,
}
