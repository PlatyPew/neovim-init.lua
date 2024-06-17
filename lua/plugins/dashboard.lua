return {
    {
        "nvimdev/dashboard-nvim",
        lazy = false,
        cond = function()
            return vim.api.nvim_buf_get_name(0) == ""
        end,
        opts = function()
            local logo = [[
         ▄▄                     ▄▄      
  ▄█▄   ▐█▌    ██     ▀█▄  ████████████▌
   ▀██  ▐█▌  ▄██        ▀   ▄▄▄▄██▄▄▄▄▄ 
     ▀  ▐█▌                ▐██  ██   █▌ 
 ▀▀▀▀▀██▀▀▀██▀▀▀▀▀   ▀▀▀█  ▐██▄▄██▄▄▄█▌ 
      █▌  ▐█▌          ▐█     ████ ▄▄   
     ██   ▐█▌          ▐█  ▄██  ▐█  ▀██▄
   ██▀    ▐█▌    ██    ▄██▄     ▐█      
▐██▀       ███████▀  ▀█▀  ▀▀▀▀█████████▀
            ]]

            logo = string.rep("\n", 8) .. logo .. "\n" .. "Better Than VSCode" .. "\n\n"

            local opts = {
                theme = "doom",
                hide = {
                    tabline = false,
                },
                config = {
                    header = vim.split(logo, "\n"),
                    center = {
                        {
                            action = "enew | startinsert",
                            desc = " New File",
                            icon = " ",
                            key = "i",
                        },
                        {
                            action = "FzfLua files",
                            desc = " Find Files",
                            icon = " ",
                            key = "f",
                        },
                        {
                            action = "FzfLua live_grep_native",
                            desc = " Find Text",
                            icon = " ",
                            key = "r",
                        },
                        {
                            action = "FzfLua marks",
                            desc = " Find Marks",
                            icon = " ",
                            key = "m",
                        },
                        {
                            action = "Oil --float",
                            desc = " File Explorer",
                            icon = " ",
                            key = "o",
                        },
                        {
                            action = "Neogit",
                            desc = " Git Interface",
                            icon = " ",
                            key = "g",
                        },
                        {
                            action = "quitall",
                            desc = " Quit",
                            icon = " ",
                            key = "q",
                        },
                    },
                    footer = function()
                        local stats = require("lazy").stats()
                        return {
                            string.format(
                                "⚡ Neovim loaded %d/%d plugins in %.2fms",
                                stats.loaded,
                                stats.count,
                                stats.startuptime
                            ),
                        }
                    end,
                },
            }

            for _, button in ipairs(opts.config.center) do
                button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
                button.key_format = "  %s"
            end

            local hl = vim.api.nvim_set_hl
            hl(0, "DashboardHeader", { fg = vim.g.palette.yellow })
            hl(0, "DashboardFooter", { fg = vim.g.palette.peach })

            return opts
        end,
    },
}
