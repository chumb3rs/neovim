return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- REMAPS
        vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP Continue" })
        vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP Step Over" })
        vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP Step Into" })
        vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP Step Out" })

        vim.keymap.set("n", "<leader>dus", function()
            local widgets = require("dap.ui.widgets");
            local sidebar = widgets.sidebar(widgets.scopes);
            sidebar.open();
        end, { desc = "Open debugging sidebar" })
        vim.keymap.set("n", "<leader>dds", dap.disconnect, { desc = "DAP Disconnect" })
        vim.keymap.set("n", "<leader>dtt", dap.terminate, { desc = "DAP Terminate" })
        vim.keymap.set("n", "<Leader>dr", dap.repl.toggle, { desc = "Toggle REPL" })
        vim.keymap.set("n", "<Leader>dl", dap.run_last, { desc = "Run Last DAP Session" })

        vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
        vim.keymap.set("n", "<Leader>dB", function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end, { desc = "Set Conditional Breakpoint" })
        vim.keymap.set("n", "<Leader>dl", function()
            dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
        end, { desc = "Set Log Point" })
        vim.keymap.set("n", "<leader>dcb", dap.clear_breakpoints, { desc = "(DAP) Clear breakpoints" })

        vim.keymap.set("n", '<leader>di', function() require "dap.ui.widgets".hover() end, { desc = "Variables" })
        vim.keymap.set("n", '<leader>d?', function()
            local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes)
        end, { desc = "Scopes" })
        vim.keymap.set("n", "<leader>dlb", "<cmd>Telescope dap list_breakpoints<cr>", { desc = "(DAP) List breakpoints" })
        vim.keymap.set("n", '<leader>dlf', '<cmd>Telescope dap frames<cr>', { desc = "List frames" })
        vim.keymap.set("n", '<leader>dlc', '<cmd>Telescope dap commands<cr>', { desc = "List commands" })
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
