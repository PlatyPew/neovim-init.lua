return {
    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        cmd = "MarkdownPreviewToggle",
        keys = {
            { "<Leader>M", "<Cmd>MarkdownPreviewToggle<CR>", desc = "Toggle Markdown Preview" },
        },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
}
