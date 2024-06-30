local wk = require("which-key")

wk.register({
    h = { name = "Kulala" },
}, { mode = "n", prefix = "<Leader>" })

-- stylua: ignore start
local remap = vim.keymap.set
remap("n", "[h", function() require("kulala").jump_prev() end, { desc = "Previous HTTP Request" })
remap("n", "]h", function() require("kulala").jump_next() end, { desc = "Next HTTP Request" })

remap("n", "<Leader>h[", function() require("kulala").jump_prev() end, { desc = "Previous HTTP Request" })
remap("n", "<Leader>h]", function() require("kulala").jump_next() end, { desc = "Next HTTP Request" })
remap("n", "<Leader>hr", function() require('kulala').run() end, { desc = "Run HTTP Request" })
-- stylua: ignore end
