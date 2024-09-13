return {
    "mfussenegger/nvim-dap",
    cmd = "DapContinue",
    keys = {
        { "<leader>dr", "<cmd> DapContinue <CR>",         mode = "n", desc = "Start or continue debugging" },
        { "<leader>db", "<cmd> DapToggleBreakpoint <CR>", mode = "n", desc = "Toggle breakpoint" },
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- REMAPS
        vim.keymap.set("n", "<leader>dus", function()
            local widgets = require("dap.ui.widgets");
            local sidebar = widgets.sidebar(widgets.scopes);
            sidebar.open();
        end, { desc = "Open debugging sidebar" })
        vim.keymap.set("n", "<leader>bc",
            "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
            { desc = "Set conditional breakpoint" })
        vim.keymap.set("n", "<leader>bl",
            "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
            { desc = "Set log point" })
        vim.keymap.set("n", '<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>", { desc = "Clear breakpoints" })
        vim.keymap.set("n", '<leader>ba', '<cmd>Telescope dap list_breakpoints<cr>', { desc = "List breakpoints" })

        vim.keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Step over" })
        vim.keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Step into" })
        vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Step out" })
        vim.keymap.set("n", '<leader>dd', "<cmd>lua require'dap'.disconnect()<cr>", { desc = "Disconnect" })
        vim.keymap.set("n", '<leader>dt', "<cmd>lua require'dap'.terminate()<cr>", { desc = "Terminate" })
        --vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = "Open REPL" })
        vim.keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", { desc = "Run last" })
        vim.keymap.set("n", '<leader>di', function() require "dap.ui.widgets".hover() end, { desc = "Variables" })
        vim.keymap.set("n", '<leader>d?', function()
            local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes)
        end, { desc = "Scopes" })
        vim.keymap.set("n", '<leader>df', '<cmd>Telescope dap frames<cr>', { desc = "List frames" })
        vim.keymap.set("n", '<leader>dh', '<cmd>Telescope dap commands<cr>', { desc = "List commands" })
        -- REMAPS

        dapui.setup()
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.after.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        dap.adapters["pwa-node"] = {
            type = "server",
            host = "127.0.0.1",
            port = 8123,
            executable = {
                command = "js-debug-adapter"
            }
        }

        for _, language in ipairs { "typscript", "javascript" } do
            dap.configurations[language] = {
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    cwd = "${workspaceFolder}",
                    runtimeExecutable = "node"
                }
            }
        end

        dap.adapters.codelldb = {
            type = "server",
            port = "${port}",
            executable = {
                command = "/usr/local/codelldb/extension/adapter/codelldb",
                args = { "--port", "${port}" },
            }
        }

        dap.configurations.cpp = {
            {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
            },
        }
        dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp
    end
}
