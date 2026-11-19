{
  lib,
  config,
  pkgs-unstable,
  ...
}:
let
  soundcraft = config.gb.home.programs.productivity.soundcraft;
in
{
  options = {
    gb.home.programs.productivity.soundcraft.enable = lib.mkEnableOption "Enable Shotcut video editor";
  };

  config = lib.mkIf soundcraft.enable {
    home.packages = [
      pkgs-unstable.soundcraft
    ];
  };
}
