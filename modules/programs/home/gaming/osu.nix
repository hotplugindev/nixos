{
  lib,
  config,
  pkgs,
  ...
}:
let
  osu = config.gb.home.programs.gaming.osu;
in
{
  options = {
    gb.home.programs.gaming.osu.enable = lib.mkEnableOption "Enables Osu";
  };

  config = lib.mkIf osu.enable {
    home.packages = [
      pkgs.osu-lazer-bin
    ];
  };
}
