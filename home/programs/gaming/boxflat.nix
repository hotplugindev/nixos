{
  lib,
  config,
  pkgs,
  username,
  ...
}:
let
  boxflat = config.gb.home.programs.gaming.boxflat;
in
{
  options = {
    gb.home.programs.gaming.boxflat.enable = lib.mkEnableOption "Enables Bottles windows emulator";
  };

  config = lib.mkIf boxflat.enable {
    home.packages = [
      pkgs.boxflat
    ];
  };
}
