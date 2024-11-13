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

--Avante
local models = { "openai", "ollama", "gemini" }
function _G.Avante_select_model()
    vim.ui.select(models, {
        prompt = "Select a model to use:",
        format_item = function(item)
            return "Model: " .. item
        end,
    }, function(choice)
        if choice then
            -- Execute the command with the selected model
            vim.cmd("AvanteSwitchProvider " .. choice)
        else
            print("No model selected")
        end
    end)
end
