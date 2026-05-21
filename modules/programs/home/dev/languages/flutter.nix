{
  lib,
  config,
  pkgs,
  ...
}:
let
  flutter = config.gb.home.dev.languages.flutter;
in
{
  options = {
    gb.home.dev.languages.flutter.enable = lib.mkEnableOption "Enable flutter language tools";
  };

  config = lib.mkIf flutter.enable {
    home.packages = [
      pkgs.flutter
    ];
  };
}
