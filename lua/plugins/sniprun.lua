return {
    "michaelb/sniprun",
    build = "bash ./install.sh",
    keys = {
        "<Plug>SnipReplMemoryClean",
        "<Plug>SnipReset",
        "<Plug>SnipClose",
        "<Plug>SnipInfo",
        "<Plug>SnipRun",
        "<Plug>SnipTerminate",
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
