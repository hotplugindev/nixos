{
  lib,
  config,
  pkgs,
  ...
}:
let
  lsp = config.gb.home.dev.nixvim.coding.lsp;
  langs = config.gb.home.dev.languages;
in
{
  options = {
    gb.home.dev.nixvim.coding.lsp = {
      enable = lib.mkEnableOption "Enable nixvim LSP configuration";
      extraPackages = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = [ ];
        description = "Extra packages for nixvim LSP and related workflows";
      };
    };
  };

  config = lib.mkIf lsp.enable {
    programs.nixvim = {
      extraPackages =
        lsp.extraPackages
        ++ [ pkgs.nixd pkgs.lua-language-server pkgs.bash-language-server pkgs.marksman pkgs.ripgrep pkgs.fd pkgs.git ]
        ++ lib.optionals langs.node.enable [
          pkgs.typescript-language-server
          pkgs.vscode-langservers-extracted
          pkgs.vue-language-server
        ]
        ++ lib.optionals langs.rust.enable [
          pkgs.rust-analyzer
          pkgs.rustfmt
          pkgs.rustc
        ]
        ++ lib.optionals langs.go.enable [ pkgs.gopls ]
        ++ lib.optionals langs.c.enable [ pkgs.clang-tools ]
        ++ lib.optionals langs.zig.enable [ pkgs.zls ]
        ++ lib.optionals langs.python.enable [ pkgs.pyright ]
        ++ lib.optionals langs.dotnet.enable [ pkgs.csharp-ls ]
        ++ lib.optionals langs.php.enable [ pkgs.phpactor ]
        ++ lib.optionals langs.flutter.enable [ pkgs.dart ];

      plugins = {
        lsp = {
          enable = true;
          inlayHints = true;

          servers =
            {
              nixd.enable = true;
              lua_ls.enable = true;
              bashls.enable = true;
              marksman.enable = true;

              ts_ls.enable = langs.node.enable;
              html.enable = langs.node.enable;
              cssls.enable = langs.node.enable;
              jsonls.enable = langs.node.enable;
              vue_ls.enable = langs.node.enable;

              gopls.enable = langs.go.enable;
              clangd.enable = langs.c.enable;
              zls.enable = langs.zig.enable;
              pyright.enable = langs.python.enable;
              csharp_ls.enable = langs.dotnet.enable;
              phpactor.enable = langs.php.enable;
              dartls.enable = langs.flutter.enable;
            }
            // lib.optionalAttrs langs.rust.enable {
              rust_analyzer = {
                enable = true;
                installCargo = false;
                installRustc = false;
              };
            };

          keymaps = {
            diagnostic = {
              "[d" = "goto_prev";
              "]d" = "goto_next";
              "<leader>ld" = "open_float";
              "<leader>lq" = "setloclist";
            };
            lspBuf = {
              "gd" = "definition";
              "gr" = "references";
              "gI" = "implementation";
              "gt" = "type_definition";
              "K" = "hover";
              "<leader>la" = "code_action";
              "<leader>lr" = "rename";
              "<leader>lf" = "format";
            };
          };
        };

        lazydev.enable = true;
      };

      extraConfigLua = ''
        vim.diagnostic.config({
          virtual_text = false,
          underline = true,
          severity_sort = true,
          float = {
            border = "rounded",
            source = "if_many",
          },
          signs = true,
        })
      '';
    };
  };
}
