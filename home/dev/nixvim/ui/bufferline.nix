{
  lib,
  config,
  ...
}:
let
  bufferline = config.gb.home.dev.nixvim.ui.bufferline;
in
{
  options = {
    gb.home.dev.nixvim.ui.bufferline.enable = lib.mkEnableOption "Enable nixvim bufferline";
  };

  config = lib.mkIf bufferline.enable {
    programs.nixvim.plugins.bufferline = {
      enable = true;
      settings.options = {
        diagnostics = "nvim_lsp";
        always_show_bufferline = true;
        separator_style = "slant";
        offsets = [
          {
            filetype = "neo-tree";
            text = "Explorer";
            highlight = "Directory";
            text_align = "left";
          }
        ];
      };
    };
  };
}