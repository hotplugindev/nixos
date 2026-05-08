{
  lib,
  config,
  pkgs,
  username,
  ...
}:
let
  vdrift = config.gb.home.programs.gaming.vdrift;
in
{
  options = {
    gb.home.programs.gaming.vdrift.enable = lib.mkEnableOption "Enables vdrift game";
  };

  config = lib.mkIf vdrift.enable {
    home.packages = [
      pkgs.vdrift-bin
    ];
  };
}
