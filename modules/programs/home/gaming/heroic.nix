{
  lib,
  config,
  pkgs-unstable,
  ...
}:
let
  heroic = config.gb.home.programs.gaming.heroic;
in
{
  options = {
    gb.home.programs.gaming.heroic.enable = lib.mkEnableOption "Enables heroic windows emulator";
  };

  config = lib.mkIf heroic.enable {
    home.packages = [
      pkgs-unstable.heroic
    ];
  };
}
