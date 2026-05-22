{
  lib,
  config,
  pkgs,
  ...
}:
let
  lsp = config.gb.home.dev.nixvim.coding.lsp;
in
{
  options = {
    gb.home.dev.nixvim.coding.lsp = {
      enable = lib.mkEnableOption "Enable nixvim LSP configuration";
      extraPackages = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = with pkgs; [
          lua-language-server
          nixd
          bash-language-server
          marksman
          clang-tools
          gopls
          vue-language-server
          vscode-langservers-extracted
          typescript-language-server
          zls
          rustc
          rust-analyzer
          rustfmt
          pyright
          csharp-ls
          stylua
          nixfmt-rfc-style
          prettierd
          shfmt
          ripgrep
          fd
          git
        ];
        description = "Extra packages for nixvim LSP and related workflows";
      };
      servers = lib.mkOption {
        type = lib.types.attrs;
        default = {
          nixd.enable = true;
          lua_ls.enable = true;
          ts_ls.enable = true;
          html.enable = true;
          cssls.enable = true;
          jsonls.enable = true;
          bashls.enable = true;
          marksman.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
          gopls.enable = true;
          clangd.enable = true;
          vue_ls.enable = true;
          zls.enable = true;
          pyright.enable = true;
          csharp_ls.enable = true;
        };
        description = "LSP server configuration for nixvim";
      };
    };
  };

  config = lib.mkIf lsp.enable {
    programs.nixvim = {
      extraPackages = lsp.extraPackages;

      plugins = {
        lsp = {
          enable = true;
          inlayHints = true;
          servers = lsp.servers;

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
