{
  lib,
  config,
  pkgs,
  ...
}:
let
  quadrapassel = config.gb.home.programs.gaming.quadrapassel;
in
{
  options = {
    gb.home.programs.gaming.quadrapassel.enable = lib.mkEnableOption "Enables quadrapassel";
  };

  config = lib.mkIf quadrapassel.enable {
    home.packages = [
      pkgs.quadrapassel
    ];
  };
}
