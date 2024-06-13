return {
    {
        "ibhagwan/fzf-lua",
        lazy = true,
        keys = {
            {
                "<C-p>",
                function()
                    require("fzf-lua").files({
                        cmd = [[ rg --files --hidden --no-ignore-vcs -g "!.git/*" ]],
                    })
                end,
            },
            {
                "<C-g>",
                function()
                    require("fzf-lua").live_grep_native()
                end,
            },
        },
        opts = {
            winopts = {
                preview = { scrollbar = false, wrap = "wrap" },
            },
        },
    },
}
