{
  lib,
  config,
  pkgs,
  ...
}:
let
  obsidian = config.gb.home.programs.productivity.obsidian;
in
{
  options = {
    gb.home.programs.productivity.obsidian.enable = lib.mkEnableOption "Enable obsidian note keeper";
  };

  config = lib.mkIf obsidian.enable {
    home.packages = [
      pkgs.obsidian
    ];
  };
}
