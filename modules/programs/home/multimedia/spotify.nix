{
  lib,
  config,
  pkgs,
  ...
}:
let
  spotify = config.gb.home.programs.multimedia.spotify;
in
{
  options = {
    gb.home.programs.multimedia.spotify.enable = lib.mkEnableOption "Enable spotify music player";
  };

  config = lib.mkIf spotify.enable {
    home.packages = [
      pkgs.spotify
    ];
  };
}
