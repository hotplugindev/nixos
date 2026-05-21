{
  lib,
  config,
  pkgs,
  ...
}:
let
  showtime = config.gb.home.programs.multimedia.showtime;
in
{
  options = {
    gb.home.programs.multimedia.showtime.enable = lib.mkEnableOption "Enable spotify music player";
  };

  config = lib.mkIf showtime.enable {
    home.packages = [
      pkgs.showtime
    ];
  };
}
