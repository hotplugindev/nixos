{
  lib,
  config,
  pkgs,
  ...
}:
let
  c = config.gb.home.dev.languages.c;
in
{
  options = {
    gb.home.dev.languages.c.enable = lib.mkEnableOption "Enable C development tools";
  };

  config = lib.mkIf c.enable {
    home.packages = [
      pkgs.gcc
      pkgs.cmake
    ];
  };
}
