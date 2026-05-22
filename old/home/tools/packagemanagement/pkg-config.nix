{
  lib,
  config,
  pkgs,
  ...
}:
let
  pkg-config = config.gb.home.tools.packagemanagement.pkg-config;
in
{
  options = {
    gb.home.tools.packagemanagement.pkg-config.enable = lib.mkEnableOption "Enable brave web browser";
  };

  config = lib.mkIf pkg-config.enable {
    home.packages = [
      pkgs.pkg-config
    ];
  };
}
