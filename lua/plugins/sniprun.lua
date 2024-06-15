return {
    "michaelb/sniprun",
    build = "bash ./install.sh",
    keys = {
        { "<Leader>rC", "<Plug>SnipReplMemoryClean", desc = "Clean REPL memory" },
        { "<Leader>rR", "<Plug>SnipReset", desc = "Reset SnipRun" },
        { "<Leader>rc", "<Plug>SnipClose", desc = "Close SnipRun" },
        { "<Leader>ri", "<Plug>SnipInfo", desc = "Get SnipRun Info" },
        { "<Leader>rr", "<Plug>SnipRun", desc = "Run Code" },
        { "<Leader>rt", "<Plug>SnipTerminate", desc = "Terminate SnipRun" },
        { "<Plug>SnipRun", mode = "v" },
    },
    opts = {
        display = { "TerminalWithCode", "VirtualTextOk" },
        selected_interpreters = { "Python3_fifo", "JS_TS_deno" },
        repl_enable = { "Python3_fifo", "JS_TS_deno" },
        snipruncolors = {
            SniprunVirtualTextOk = {
                fg = vim.g.catppuccin_crust,
                bg = vim.g.catppuccin_teal,
            },
        },
    },
}
