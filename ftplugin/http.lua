local wk = require("which-key")

wk.add({
    h = { name = "Kulala" },
}, { mode = "n", prefix = "<Leader>" })

-- stylua: ignore start
local remap = vim.keymap.set
remap("n", "[h", function() require("kulala").jump_prev() end, { desc = "Previous HTTP Request" })
remap("n", "]h", function() require("kulala").jump_next() end, { desc = "Next HTTP Request" })

remap("n", "<Leader>h[", function() require("kulala").jump_prev() end, { desc = "Previous HTTP Request" })
remap("n", "<Leader>h]", function() require("kulala").jump_next() end, { desc = "Next HTTP Request" })
remap("n", "<Leader>hr", function() require('kulala').run() end, { desc = "Run HTTP Request" })
remap("n", "<Leader>hR", function() require('kulala').run_all() end, { desc = "Run All HTTP Requests" })
remap("n", "<Leader>hi", function() require('kulala').inspect() end, { desc = "Inspect HTTP Request" })
remap("n", "<Leader>hs", function() require('kulala').show_stats() end, { desc = "Show HTTP Request Stats" })
remap("n", "<Leader>hc", function() require('kulala').copy() end, { desc = "Copy HTTP Request as cURL" })
remap("n", "<Leader>hC", function() require('kulala').from_curl() end, { desc = "Import from cURL" })
remap("n", "<Leader>ht", function() require('kulala').toggle_view() end, { desc = "Toogle HTTP Body or Header" })
-- stylua: ignore end
