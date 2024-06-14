-- Diffview
function _G.DiffviewToggle()
    local lib = require("diffview.lib")
    local view = lib.get_current_view()
    if view then
        vim.cmd.DiffviewClose()
    else
        vim.cmd.DiffviewOpen()
    end
end

-- Oil
function _G.OilToggle()
    vim.cmd("vertical split | wincmd h | enew | vertical resize 35")
    require("oil").open()
end
