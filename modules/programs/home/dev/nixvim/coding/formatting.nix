{
  lib,
  config,
  ...
}:
let
  formatting = config.gb.home.dev.nixvim.coding.formatting;
in
{
  options = {
    gb.home.dev.nixvim.coding.formatting.enable = lib.mkEnableOption "Enable nixvim formatting";
  };

  config = lib.mkIf formatting.enable {
    programs.nixvim.plugins.conform-nvim = {
      enable = true;
      settings = {
        format_on_save = {
          timeout_ms = 1000;
          lsp_fallback = true;
        };
        formatters_by_ft = {
          nix = [ "nixfmt" ];
          lua = [ "stylua" ];
          sh = [ "shfmt" ];
          bash = [ "shfmt" ];
          javascript = [ "prettierd" ];
          typescript = [ "prettierd" ];
          javascriptreact = [ "prettierd" ];
          typescriptreact = [ "prettierd" ];
          json = [ "prettierd" ];
          html = [ "prettierd" ];
          css = [ "prettierd" ];
          markdown = [ "prettierd" ];
          yaml = [ "prettierd" ];
        };
      };
    };
  };
}