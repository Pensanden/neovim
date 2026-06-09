return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",     -- the actual UI panels
    "nvim-neotest/nvim-nio"
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- open/close UI automatically when debugging starts/ends
    dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
    dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
    dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

    dapui.setup()
  end,
  keys = {
    { "<F5>",       function() require("dap").continue() end,          desc = "Debug: Continue" },
    { "<F10>",      function() require("dap").step_over() end,         desc = "Debug: Step Over" },
    { "<F11>",      function() require("dap").step_into() end,         desc = "Debug: Step Into" },
    { "<F12>",      function() require("dap").step_out() end,          desc = "Debug: Step Out" },
    { "<C-B>", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Conditional Breakpoint" },
    { "<leader>dr", function() require("dap").repl.open() end,         desc = "Open REPL" },
    { "<leader>du", function() require("dapui").toggle() end,          desc = "Toggle DAP UI" },
  },
}
