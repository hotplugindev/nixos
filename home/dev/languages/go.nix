{
  lib,
  config,
  pkgs,
  ...
}:
let
  go = config.gb.home.dev.languages.go;
in
{
  options = {
    gb.home.dev.languages.go.enable = lib.mkEnableOption "Enable Go language tools";
  };

  config = lib.mkIf go.enable {
    home.packages = [
      pkgs.go
    ];
  };
}
