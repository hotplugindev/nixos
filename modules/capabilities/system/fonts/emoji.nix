{
  lib,
  config,
  pkgs,
  ...
}:
let
  requested = config.gb.requires.system.fonts.emoji != [ ];
in
{
  config = lib.mkIf requested {
    fonts.packages = [ pkgs.noto-fonts-color-emoji ];
  };
}
