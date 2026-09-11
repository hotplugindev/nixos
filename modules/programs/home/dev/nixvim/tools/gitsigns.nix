{
  lib,
  config,
  ...
}:
let
  gitsigns = config.gb.home.dev.nixvim.tools.gitsigns;
in
{
  options = {
    gb.home.dev.nixvim.tools.gitsigns.enable =
      lib.mkEnableOption "Enable nixvim gitsings for fast git feedback in file";
  };

  config = lib.mkIf gitsigns.enable {
    programs.nixvim.plugins = {
      gitsigns = {
        enable = true;
        settings = {
          current_line_blame = true;
          signcolumn = true;
        };
      };

      fugitive.enable = true;
    };
  };
}
