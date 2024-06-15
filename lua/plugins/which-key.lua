return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeoutlen = 500
    end,
    opts = {
        ignore_missing = true,
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)

        wk.register({
            R = { name = "Overseer" },
            c = { name = "Copilot" },
            d = { name = "DAP", f = { name = "FZF" } },
            f = { name = "FZF" },
            g = { name = "Git" },
            i = {
                name = "Installers",
                l = { "<Cmd>Lazy<CR>", "Plugin Manager" },
                m = { "<Cmd>Mason<CR>", "LSP Installer" },
            },
            l = {
                name = "LSP",
                f = { name = "FZF" },
                i = { "<Cmd>LspInfo<CR>", "LSP Info" },
            },
            m = { name = "Harpoon" },
            r = { name = "Sniprun" },
        }, { mode = "n", prefix = "<Leader>" })

        wk.register({
            c = {
                name = "Copilot",
            },
            s = {
                name = "Git",
            },
            r = {
                name = "Sniprun",
            },
        }, { mode = "v", prefix = "<Leader>" })

        wk.register({
            D = { "<Cmd>DogeGenerate<CR>", "Generate Docs" },
            S = { "<Cmd>DBUIToggle<CR>", "Open DB UI" },
            F = { "<Cmd>lua vim.lsp.buf.format({ async = true })<CR>", "Format code" },
            R = {
                name = "Overseer",
                O = { "<Cmd>OverseerToggle right<CR>", "Toggles overseer window" },
                R = { "<Cmd>OverseerRun<CR>", "Run builtin" },
                r = { "<Cmd>OverseerRunCmd<CR>", "Run command" },
            },
            W = { "<Cmd>SudaWrite<CR>", "Write with sudo" },
            o = { "<Cmd>lua require('oil').toggle_float()<CR>", "Edit Filesystem" },
            p = { "<Cmd>Incolla<CR>", "Paste Image" },
            u = { "<Cmd>UndotreeToggle<CR>", "Toggle UndoTree" },
            m = { "<Cmd>MarkdownPreviewToggle<CR>", "Toggle Markdown Preview" },
            t = { "<Cmd>Lspsaga term_toggle<CR>", "Open Terminal" },
            c = {
                name = "Copilot",
                c = { "<Cmd>CopilotChatToggle<CR>", "Toggle Copilot Chat" },
                t = { "<Cmd>Copilot toggle<CR>", "Toggle Copilot" },
                p = { "<Cmd>Copilot panel<CR>", "Copilot Panel" },
                s = { "<Cmd>Copilot status<CR>", "Copilot Status" },
            },
            d = {
                name = "Debugger",
                C = { "<Cmd>lua require'dap'.disconnect()<CR>", "Close" },
                R = { "<Cmd>lua require'dap'.repl.open()<CR>", "REPL" },
                S = { "<Cmd>lua require'dap'.step_into()<CR>", "Step Into" },
                a = { "<Cmd>lua _G.dap_args()<CR>", "Set Program Arguments" },
                b = { "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint" },
                c = { "<Cmd>lua require'dap'.continue()<CR>", "Continue" },
                e = { "<Cmd>lua require'dapui'.eval()<CR>", "Evaluate" },
                p = { "<Cmd>lua _G.dap_program()<CR>", "Set Executable Path" },
                o = { "<Cmd>lua require'dap'.step_out()<CR>", "Step Out" },
                s = { "<Cmd>lua require'dap'.step_over()<CR>", "Step Over" },
                u = { "<Cmd>lua require'dapui'.toggle()<CR>", "Open UI" },
            },
            f = {
                name = "FZF",
                ["/"] = { "<Cmd>lua require'fzf-lua'.blines()<CR>", "Lines in Buffer" },
                C = { "<Cmd>lua require'fzf-lua'.git_commits()<CR>", "Commits" },
                D = {
                    "<Cmd>lua require'fzf-lua'.lsp_workspace_diagnostics()<CR>",
                    "Workspace Diagnostics",
                },
                G = { "<Cmd>lua require'fzf-lua'.git_status()<CR>", "Git Status Files" },
                M = { "<Cmd>lua require'fzf-lua'.keymaps()<CR>", "Mappings" },
                b = { "<Cmd>lua require'fzf-lua'.buffers()<CR>", "Buffers" },
                c = { "<Cmd>lua require'fzf-lua'.git_bcommits()<CR>", "Commits for Buffer" },
                d = {
                    "<Cmd>lua require'fzf-lua'.lsp_document_diagnostics()<CR>",
                    "Document Diagnostics",
                },
                f = {
                    "<Cmd>lua require'fzf-lua'.files({cmd='rg --files --hidden --no-ignore-vcs -g \"!.git/*\"'})<CR>",
                    "Files",
                },
                g = { "<Cmd>lua require'fzf-lua'.git_files()<CR>", "Git Files" },
                h = { "<Cmd>lua require'fzf-lua'.command_history()<CR>", "Command History" },
                m = { "<Cmd>lua require'fzf-lua'.marks()<CR>", "Marks" },
                r = { "<Cmd>lua require'fzf-lua'.live_grep_native()<CR>", "Ripgrep" },
                s = { "<Cmd>lua require'fzf-lua'.spell_suggest()<CR>", "Spell Suggest" },
            },
            h = {
                name = "Harpoon",
                ["["] = { "<Cmd>lua require'harpoon.ui'.nav_prev()<CR>", "Previous Harpoon" },
                ["]"] = { "<Cmd>lua require'harpoon.ui'.nav_next()<CR>", "Next Harpoon" },
                h = { "<Cmd>lua require'harpoon.mark'.add_file()<CR>", "Add file to Harpoon" },
                m = { "<Cmd>lua require'harpoon.ui'.toggle_quick_menu()<CR>", "List Harpoons" },
            },
            g = {
                name = "Git",
                R = { "<Cmd>Gitsigns reset_buffer<CR>", "Reset Buffer" },
                S = { "<Cmd>Gitsigns stage_buffer<CR>", "Stage Buffer" },
                U = { "<Cmd>Gitsigns reset_buffer_index<CR>", "Reset Buffer Index" },
                ["["] = { "<Cmd>Gitsigns prev_hunk<CR>", "Previous Hunk" },
                ["]"] = { "<Cmd>Gitsigns next_hunk<CR>", "Next Hunk" },
                b = { "<Cmd>Gitsigns blame_line<CR>", "Blame Line" },
                d = { "<Cmd>lua _G.DiffviewToggle()<CR>", "Show Diff" },
                g = { "<Cmd>Neogit<CR>", "Open Neogit" },
                h = { "<Cmd>DiffviewFileHistory<CR>", "Open History" },
                p = { "<Cmd>Gitsigns preview_hunk<CR>", "Preview Hunk" },
                r = { "<Cmd>Gitsigns reset_hunk<CR>", "Reset Hunk" },
                s = { "<Cmd>Gitsigns stage_hunk<CR>", "Stage Hunk" },
                t = { "<Cmd>Gitsigns toggle_word_diff<CR>", "Toggle Word Diff" },
                u = { "<Cmd>Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk" },
            },
            l = {
                name = "LSP",
                D = { "<Cmd>Lspsaga show_buf_diagnostics<CR>", "Show Buffer Diagnostics" },
                ["["] = { "<Cmd>Lspsaga diagnostic_jump_prev<CR>", "Previous Diagnostic" },
                ["]"] = { "<Cmd>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic" },
                c = { "<Cmd>Lspsaga code_action<CR>", "Code Action" },
                d = { "<Cmd>Lspsaga show_line_diagnostics<CR>", "Show Line Diagnostics" },
                f = { "<Cmd>Lspsaga finder<CR>", "Find Reference" },
                h = { "<Cmd>Lspsaga hover_doc<CR>", "Docs" },
                i = { "<Cmd>LspInfo<CR>", "LSP Info" },
                o = { "<Cmd>Lspsaga outline<CR>", "Show Outline" },
                p = { "<Cmd>Lspsaga peek_definition<CR>", "Preview Definition" },
                r = { "<Cmd>Lspsaga rename<CR>", "Rename Variable" },
            },
            r = {
                name = "Runner",
                C = { "<Plug>SnipReplMemoryClean", "Clean REPL memory" },
                R = { "<Plug>SnipReset", "Reset SnipRun" },
                c = { "<Plug>SnipClose", "Close SnipRun" },
                i = { "<Plug>SnipInfo", "Get SnipRun Info" },
                r = { "<Plug>SnipRun", "Run Code" },
                t = { "<Plug>SnipTerminate", "Terminate SnipRun" },
            },
        }, { mode = "n", prefix = "," })

        wk.register({
            C = { "<Cmd>lua require('Comment.api').call('toggle_linewise_op')<CR>g@", "Comment" },
            c = {
                name = "Copilot Chat",
                D = { "<Cmd>CopilotChatDocs<CR>", "Copilot Chat Docs" },
                T = { "<Cmd>CopilotChatTests<CR>", "Copilot Chat Tests" },
                d = { "<Cmd>CopilotChatFixDiagnostic<CR>", "Copilot Chat Fix Diagnostics" },
                e = { "<Cmd>CopilotChatExplain<CR>", "Copilot Chat Explain" },
                f = { "<Cmd>CopilotChatFix<CR>", "Copilot Chat Fix" },
                o = { "<Cmd>CopilotChatOptimize<CR>", "Copilot Chat Optimise" },
                r = { "<Cmd>CopilotChatReview<CR>", "Copilot Chat Review" },
            },
            g = {
                name = "Git",
                s = { "<Cmd>Gitsigns stage_hunk<CR>", "Stage Hunk" },
                u = { "<Cmd>Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk" },
            },
            r = {
                name = "Runner",
                r = { "<Plug>SnipRun", "Run Code" },
            },
        }, { mode = "v", prefix = "," })
    end,
}
