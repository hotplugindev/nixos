{
  lib,
  config,
  pkgs,
  ...
}:
let
  dap = config.gb.home.dev.nixvim.coding.dap;
  langs = config.gb.home.dev.languages;
  hasCodelldb = langs.c.enable || langs.rust.enable;
in
{
  options = {
    gb.home.dev.nixvim.coding.dap = {
      enable = lib.mkEnableOption "Enable nixvim DAP configuration";
    };
  };

  config = lib.mkIf dap.enable {
    programs.nixvim = {
      extraPackages =
        lib.optionals hasCodelldb [ pkgs.lldb ]
        ++ lib.optionals langs.python.enable [ pkgs.python3Packages.debugpy ]
        ++ lib.optionals langs.go.enable [ pkgs.delve ]
        ++ lib.optionals langs.node.enable [ pkgs.nodejs ]
        ++ lib.optionals langs.dotnet.enable [ pkgs.netcoredbg ]
        ++ lib.optionals langs.flutter.enable [ pkgs.dart ]
        ++ lib.optionals langs.php.enable [ pkgs.php ];

      plugins = {
        dap = {
          enable = true;

          adapters.executables =
            lib.optionalAttrs hasCodelldb {
              codelldb = {
                command = "${pkgs.lldb}/bin/codelldb";
              };
            }
            // lib.optionalAttrs langs.python.enable {
              debugpy = {
                command = "${pkgs.python3Packages.debugpy}/bin/debugpy-adapter";
              };
            }
            // lib.optionalAttrs langs.go.enable {
              delve = {
                command = "${pkgs.delve}/bin/dlv";
                args = [ "dap" "--listen" "127.0.0.1:$${port}" ];
              };
            }
            // lib.optionalAttrs langs.node.enable {
              js-debug = {
                command = "${pkgs.nodejs}/bin/node";
                args = [
                  "${pkgs.vscode-js-debug}/lib/node_modules/vscode-js-debug/dist/src/nodeDebug.js"
                ];
              };
            }
            // lib.optionalAttrs langs.dotnet.enable {
              netcoredbg = {
                command = "${pkgs.netcoredbg}/bin/netcoredbg";
                args = [ "--interpreter=vscode" ];
              };
            }
            // lib.optionalAttrs langs.flutter.enable {
              dart = {
                command = "${pkgs.dart}/bin/dart";
                args = [ "debug_adapter" ];
              };
            };

          configurations =
            lib.optionalAttrs hasCodelldb {
              c = [
                {
                  name = "Launch (C/C++)";
                  type = "codelldb";
                  request = "launch";
                  program.__raw = ''
                    function()
                      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end
                  '';
                  cwd.__raw = "vim.fn.getcwd()";
                  stopOnEntry = false;
                }
              ];
              cpp = [
                {
                  name = "Launch (C++)";
                  type = "codelldb";
                  request = "launch";
                  program.__raw = ''
                    function()
                      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end
                  '';
                  cwd.__raw = "vim.fn.getcwd()";
                  stopOnEntry = false;
                }
              ];
              rust = [
                {
                  name = "Launch (Rust)";
                  type = "codelldb";
                  request = "launch";
                  program.__raw = ''
                    function()
                      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
                    end
                  '';
                  cwd.__raw = "vim.fn.getcwd()";
                  stopOnEntry = false;
                }
              ];
            }
            // lib.optionalAttrs langs.python.enable {
              python = [
                {
                  name = "Launch (Python)";
                  type = "debugpy";
                  request = "launch";
                  program.__raw = "vim.fn.expand('%:p')";
                  cwd.__raw = "vim.fn.getcwd()";
                  console = "integratedTerminal";
                }
              ];
            }
            // lib.optionalAttrs langs.go.enable {
              go = [
                {
                  name = "Launch (Go)";
                  type = "delve";
                  request = "launch";
                  program.__raw = "vim.fn.expand('%:p')";
                  cwd.__raw = "vim.fn.getcwd()";
                }
                {
                  name = "Debug Test (Go)";
                  type = "delve";
                  request = "launch";
                  mode = "test";
                  program.__raw = "vim.fn.expand('%:p')";
                  cwd.__raw = "vim.fn.getcwd()";
                }
              ];
            }
            // lib.optionalAttrs langs.node.enable {
              javascript = [
                {
                  name = "Launch (Node)";
                  type = "js-debug";
                  request = "launch";
                  program.__raw = "vim.fn.expand('%:p')";
                  cwd.__raw = "vim.fn.getcwd()";
                  runtimeExecutable = "node";
                }
              ];
              typescript = [
                {
                  name = "Launch (TS)";
                  type = "js-debug";
                  request = "launch";
                  program.__raw = "vim.fn.expand('%:p')";
                  cwd.__raw = "vim.fn.getcwd()";
                  runtimeExecutable = "node";
                }
              ];
            }
            // lib.optionalAttrs langs.dotnet.enable {
              cs = [
                {
                  name = "Launch (.NET)";
                  type = "netcoredbg";
                  request = "launch";
                  program.__raw = ''
                    function()
                      return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
                    end
                  '';
                  cwd.__raw = "vim.fn.getcwd()";
                }
              ];
            }
            // lib.optionalAttrs langs.flutter.enable {
              dart = [
                {
                  name = "Launch (Dart)";
                  type = "dart";
                  request = "launch";
                  program.__raw = "vim.fn.expand('%:p')";
                  cwd.__raw = "vim.fn.getcwd()";
                }
              ];
            }
            // lib.optionalAttrs langs.php.enable {
              php = [
                {
                  name = "Launch (PHP)";
                  type = "php";
                  request = "launch";
                  program.__raw = "vim.fn.expand('%:p')";
                  cwd.__raw = "vim.fn.getcwd()";
                  port = 9003;
                }
              ];
            };

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

        dap-ui.enable = true;
        dap-virtual-text.enable = true;
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
