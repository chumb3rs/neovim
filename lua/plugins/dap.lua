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
    end
}
