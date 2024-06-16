return {
    {
        "mattn/emmet-vim",
        -- stylua: ignore
        keys = {
            { "<C-Y>,", "<Plug>(emmet-expand-abbr)", mode = { "i", "n", "v" } },
            { "<C-Y>/", "<Plug>(emmet-toggle-comment)", mode = { "i", "n" } },
            { "<C-Y>;", "<Plug>(emmet-expand-word)", mode = { "i", "n" } },
            { "<C-Y>D", "<Plug>(emmet-balance-tag-outword)", mode = { "i", "n", "v" } },
            { "<C-Y>I", "<Plug>(emmet-image-encode)", mode = { "i", "n" } },
            { "<C-Y>a", "<Plug>(emmet-anchorize-url)", mode = { "i", "n" } },
            { "<C-Y>d", "<Plug>(emmet-balance-tag-inward)", mode = { "i", "n", "v" } },
            { "<C-Y>i", "<Plug>(emmet-image-size)", mode = { "i", "n" } },
            { "<C-Y>j", "<Plug>(emmet-split-join-tag)", mode = { "i", "n" } },
            { "<C-Y>k", "<Plug>(emmet-merge-lines)", mode = { "i", "n" } },
            { "<C-Y>k", "<Plug>(emmet-remove-tag)", mode = { "i", "n" } },
            { "<C-Y>u", "<Plug>(emmet-update-tag)", mode = { "i", "n" } },
        },
    },
}
