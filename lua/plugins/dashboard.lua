return {
    {
        "nvimdev/dashboard-nvim",
        commit = "a36b3232c98616149784f2ca2654e77caea7a522",
        event = "VimEnter",
        cmd = "Dashboard",
        cond = function()
            return vim.api.nvim_buf_get_name(0) == ""
        end,
        config = function()
            vim.bo.buftype = "nofile"

            vim.g.dashboard_custom_header = {
                "         ▄▄                     ▄▄      ",
                "  ▄█▄   ▐█▌    ██     ▀█▄  ████████████▌",
                "   ▀██  ▐█▌  ▄██        ▀   ▄▄▄▄██▄▄▄▄▄ ",
                "     ▀  ▐█▌                ▐██  ██   █▌ ",
                " ▀▀▀▀▀██▀▀▀██▀▀▀▀▀   ▀▀▀█  ▐██▄▄██▄▄▄█▌ ",
                "      █▌  ▐█▌          ▐█     ████ ▄▄   ",
                "     ██   ▐█▌          ▐█  ▄██  ▐█  ▀██▄",
                "   ██▀    ▐█▌    ██    ▄██▄     ▐█      ",
                "▐██▀       ███████▀  ▀█▀  ▀▀▀▀█████████▀",
                "                                        ",
                "           Better Than VSCode           ",
            }

            vim.g.dashboard_custom_section = {
                a = {
                    description = { "  New File                  e" },
                    command = ":enew",
                },
                b = {
                    description = { "  Find files              ,ff" },
                    command = ":lua require'fzf-lua'.files({cmd='rg --files --hidden --no-ignore-vcs -g \"!.git/*\"'})",
                },
                c = {
                    description = { "  Find Word               ,fr" },
                    command = ":lua require'fzf-lua'.live_grep_native()",
                },
                d = {
                    description = { "  Find Marks              ,fm" },
                    command = ":lua require'fzf-lua'.marks()",
                },
                e = {
                    description = { "  File Explorer            ,o" },
                    command = ":NvimTreeToggle",
                },
                f = {
                    description = { "  Exit                      q" },
                    command = ":exit",
                },
            }

            vim.g.dashboard_custom_footer = { "Stay Hydrated Folks" }

            local hl = vim.api.nvim_set_hl
            hl(0, "DashboardHeader", { fg = vim.g.catppuccin_yellow })
            hl(0, "DashboardFooter", { fg = vim.g.catppuccin_peach })
        end,
    },
}
