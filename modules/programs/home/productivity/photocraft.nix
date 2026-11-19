{
  lib,
  config,
  pkgs-unstable,
  ...
}:
let
  photocraft = config.gb.home.programs.productivity.photocraft;
in
{
  options = {
    gb.home.programs.productivity.photocraft.enable = lib.mkEnableOption "Enable Shotcut video editor";
  };

  config = lib.mkIf photocraft.enable {
    home.packages = [
      pkgs-unstable.photocraft
    ];
  };
}
