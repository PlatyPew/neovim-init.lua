require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "catppuccin",
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        globalstatus = true,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename", "filesize" },
        lualine_x = {
            {
                require("noice").api.status.mode.get,
                cond = require("noice").api.status.mode.has,
                color = { fg = "#6c7086" },
            },
            "%S",
            "location",
            {
                "filetype",
                colored = true,
            },
        },
        lualine_y = {
            {
                "encoding",
                padding = { left = 1, right = 0 },
            },
            "fileformat",
        },
        lualine_z = {
            {
                "diagnostics",
                sources = { "nvim_diagnostic" },
                symbols = { error = " ", warn = " ", info = " " },
                diagnostics_color = {
                    error = { bg = "#222424", fg = "#cf637e" },
                    warn = { bg = "#222424", fg = "#f4a261" },
                    info = { bg = "#222424", fg = "#dbc074" },
                    hint = { bg = "#222424", fg = "#dbc074" },
                },
            },
        },
    },
    tabline = {
        lualine_a = {
            {
                "buffers",
                buffers_color = {
                    inactive = { bg = "#44475a", fg = "#ffffff" },
                },
                padding = 1,
                filetype_names = {
                    dashboard = "󰕮 Dashboard",
                    NvimTree = " NvimTree",
                    mason = "󰇚 Mason",
                    undotree = " UndoTree",
                    lspinfo = " LSP Info",
                    lazy = "󰒲 Lazy",
                    harpoon = "󱡅 Harpoon",
                },
            },
        },
        lualine_y = {
            function()
                return [[buffers]]
            end,
        },
    },
    extensions = { "nvim-tree", "nvim-dap-ui", "quickfix" },
})
