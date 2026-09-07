{
  lib,
  config,
  ...
}:
let
  dap = config.gb.home.dev.nixvim.keymaps.dap;
in
{
  options = {
    gb.home.dev.nixvim.keymaps.dap.enable = lib.mkEnableOption "Enable nixvim DAP keymaps";
  };

  config = lib.mkIf dap.enable {
    programs.nixvim.keymaps = [
      {
        mode = "n";
        key = "<F5>";
        action = {
          __raw = ''
            function()
              require("dap").continue()
            end
          '';
        };
        options.desc = "Debug: Continue";
      }
      {
        mode = "n";
        key = "<F9>";
        action = {
          __raw = ''
            function()
              require("dap").step_over()
            end
          '';
        };
        options.desc = "Debug: Step Over";
      }
      {
        mode = "n";
        key = "<F10>";
        action = {
          __raw = ''
            function()
              require("dap").step_into()
            end
          '';
        };
        options.desc = "Debug: Step Into";
      }
      {
        mode = "n";
        key = "<F11>";
        action = {
          __raw = ''
            function()
              require("dap").step_out()
            end
          '';
        };
        options.desc = "Debug: Step Out";
      }
      {
        mode = "n";
        key = "<Leader>db";
        action = {
          __raw = ''
            function()
              require("dap").toggle_breakpoint()
            end
          '';
        };
        options.desc = "Debug: Toggle Breakpoint";
      }
      {
        mode = "n";
        key = "<Leader>dB";
        action = {
          __raw = ''
            function()
              require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end
          '';
        };
        options.desc = "Debug: Conditional Breakpoint";
      }
      {
        mode = "n";
        key = "<Leader>dl";
        action = {
          __raw = ''
            function()
              require("dap").run_last()
            end
          '';
        };
        options.desc = "Debug: Run Last";
      }
      {
        mode = "n";
        key = "<Leader>du";
        action = {
          __raw = ''
            function()
              require("dapui").toggle()
            end
          '';
        };
        options.desc = "Debug: Toggle UI";
      }
      {
        mode = "n";
        key = "<Leader>dr";
        action = {
          __raw = ''
            function()
              require("dap").repl.toggle()
            end
          '';
        };
        options.desc = "Debug: Toggle REPL";
      }
    ];
  };
}
