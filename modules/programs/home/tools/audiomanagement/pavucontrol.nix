{
  lib,
  config,
  pkgs,
  ...
}:
let
  pavucontrol = config.gb.home.tools.audiomanagement.pavucontrol;
in
{
  options = {
    gb.home.tools.audiomanagement.pavucontrol.enable = lib.mkEnableOption "Enable brave web browser";
  };

  config = lib.mkIf pavucontrol.enable {
    home.packages = [
      pkgs.pavucontrol
    ];
  };
}
