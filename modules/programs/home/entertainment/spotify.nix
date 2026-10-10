{
  lib,
  config,
  pkgs,
  ...
}:
let
  spotify = config.gb.home.programs.entertainment.spotify;
in
{
  options = {
    gb.home.programs.entertainment.spotify.enable = lib.mkEnableOption "Enable spotify music player";
  };

  config = lib.mkIf spotify.enable {
    home.packages = [
      pkgs.spotify
    ];
  };
}
