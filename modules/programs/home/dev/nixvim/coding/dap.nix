{
  lib,
  config,
  pkgs,
  ...
}:
let
  dap = config.gb.home.dev.nixvim.coding.dap;
in
{
  options = {
    gb.home.dev.nixvim.coding.dap = {
      enable = lib.mkEnableOption "Enable nixvim DAP configuration";
    };
  };

  config = lib.mkIf dap.enable {
    programs.nixvim = {
      plugins = {
        dap = {
          enable = true;
          adapters = {};
          signs = {
            dapBreakpoint = {
              text = "●";
              texthl = "DapBreakpoint";
            };
            dapBreakpointCondition = {
              text = "●";
              texthl = "DapBreakpointCondition";
            };
            dapLogPoint = {
              text = "◆";
              texthl = "DapLogPoint";
            };
          };
        };

        dap-ui = {
          enable = true;
        };

        dap-virtual-text = {
          enable = true;
        };
      };

      extraConfigLua = ''
        local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup({
          icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
          mappings = {
            expand = { "<CR>", "<2-LeftMouse>" },
            open = "o",
            remove = "d",
            edit = "e",
            repl = "r",
            toggle = "t",
          },
          layouts = {
            {
              elements = {
                { id = "scopes", size = 0.33 },
                { id = "breakpoints", size = 0.17 },
                { id = "stacks", size = 0.25 },
                { id = "watches", size = 0.25 },
              },
              size = 0.33,
              position = "right",
            },
            {
              elements = {
                { id = "repl", size = 0.45 },
                { id = "console", size = 0.55 },
              },
              size = 0.27,
              position = "bottom",
            },
          },
          floating = {
            max_height = 0.9,
            max_width = 0.9,
            border = "rounded",
          },
        })

        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end

        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close()
        end

        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close()
        end

        vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Continue" })
        vim.keymap.set("n", "<F9>", dap.step_over, { desc = "Debug: Step Over" })
        vim.keymap.set("n", "<F10>", dap.step_into, { desc = "Debug: Step Into" })
        vim.keymap.set("n", "<F11>", dap.step_out, { desc = "Debug: Step Out" })
        vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
        vim.keymap.set("n", "<Leader>dB", function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end, { desc = "Debug: Conditional Breakpoint" })
        vim.keymap.set("n", "<Leader>dl", dap.run_last, { desc = "Debug: Run Last" })
        vim.keymap.set("n", "<Leader>du", dapui.toggle, { desc = "Debug: Toggle UI" })
        vim.keymap.set("n", "<Leader>dr", dap.repl.toggle, { desc = "Debug: Toggle REPL" })
      '';
    };
  };
}
