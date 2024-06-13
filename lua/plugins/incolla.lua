return {
    {
        "mattdibi/incolla.nvim",
        cmd = "Incolla",
        cond = function()
            return vim.fn.has("macunix") == 1
        end,
        opts = {
            defaults = {
                img_dir = "img",
                img_name = function()
                    return os.date("%Y-%m-%d-%H-%M-%S")
                end,
                affix = "%s",
            },
            markdown = { affix = "![](%s)" },
        },
    },
}
