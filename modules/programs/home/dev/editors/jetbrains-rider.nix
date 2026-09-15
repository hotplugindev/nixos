{
  lib,
  config,
  pkgs,
  ...
}:
let
  jetbrains-rider = config.gb.home.dev.editors.jetbrains-rider;
in
{
  options = {
    gb.home.dev.editors.jetbrains-rider.enable = lib.mkEnableOption "Enable JetBrains Rider";
  };

  config = lib.mkIf jetbrains-rider.enable {
    home.packages = [
      pkgs.jetbrains.rider
    ];
  };
}
