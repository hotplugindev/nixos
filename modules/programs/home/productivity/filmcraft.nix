{
  lib,
  config,
  pkgs-unstable,
  ...
}:
let
  filmcraft = config.gb.home.programs.productivity.filmcraft;
in
{
  options = {
    gb.home.programs.productivity.filmcraft.enable = lib.mkEnableOption "Enable Shotcut video editor";
  };

  config = lib.mkIf filmcraft.enable {
    home.packages = [
      pkgs-unstable.soundcraft
    ];
  };
}
