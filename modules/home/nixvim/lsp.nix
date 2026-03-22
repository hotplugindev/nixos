{ pkgs, ... }:
{
  programs.nixvim = {
    extraPackages = with pkgs; [
      stylua
      nixfmt-rfc-style
      prettierd
      ripgrep
      fd
    ];

    plugins = {
      lsp = {
        enable = true;

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
            "<leader>ld" = "open_float";
            "[d" = "goto_prev";
            "]d" = "goto_next";
          };

          lspBuf = {
            gd = "definition";
            gD = "references";
            gi = "implementation";
            gt = "type_definition";
            K = "hover";
            "<leader>ca" = "code_action";
            "<leader>rn" = "rename";
          };
        };
      };

      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            timeout_ms = 1000;
            lsp_fallback = true;
          };

          formatters_by_ft = {
            nix = [ "nixfmt" ];
            lua = [ "stylua" ];
            javascript = [ "prettierd" ];
            typescript = [ "prettierd" ];
            javascriptreact = [ "prettierd" ];
            typescriptreact = [ "prettierd" ];
            json = [ "prettierd" ];
            markdown = [ "prettierd" ];
          };
        };
      };
    };
  };
}
