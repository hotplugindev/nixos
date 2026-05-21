{
  lib,
  config,
  ...
}:
let
  git = config.gb.home.dev.nixvim.tools.git;
in
{
  options = {
    gb.home.dev.nixvim.tools.git.enable = lib.mkEnableOption "Enable nixvim git tools";
  };

  config = lib.mkIf git.enable {
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