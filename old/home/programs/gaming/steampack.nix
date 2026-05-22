{
  lib,
  config,
  pkgs,
  ...
}:
let
  steampack = config.gb.home.programs.gaming.steampack;
in
{
  options = {
    gb.home.programs.gaming.steampack.enable =
      lib.mkEnableOption "Enables some essentials for steam like protonup or mangohud";
  };

  config = lib.mkIf steampack.enable {
    home.packages = with pkgs; [
      mangohud
      gamescope
      protonup-qt
      protontricks
    ];
  };
}
