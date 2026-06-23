{
  lib,
  config,
  pkgs,
  ...
}:
let
  gparted = config.gb.home.tools.gparted;
in
{
  options = {
    gb.home.tools.gparted.enable = lib.mkEnableOption "Enable brave web browser";
  };

  config = lib.mkIf gparted.enable {
    home.packages = [
      pkgs.gparted
    ];
  };
}
