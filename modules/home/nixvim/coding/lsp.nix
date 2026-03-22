{ pkgs, ... }:
{
  programs.nixvim = {
    extraPackages = with pkgs; [
      lua-language-server
      nixd
      vscode-langservers-extracted
      typescript-language-server
      bash-language-server
      marksman
      stylua
      nixfmt-rfc-style
      prettierd
      shfmt
      ripgrep
      fd
      git
    ];

    plugins = {
      lsp = {
        enable = true;
        inlayHints = true;

        servers = {
          nixd.enable = true;
          lua_ls.enable = true;
          ts_ls.enable = true;
          html.enable = true;
          cssls.enable = true;
          jsonls.enable = true;
          bashls.enable = true;
          marksman.enable = true;
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
}