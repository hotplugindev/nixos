{
  lib,
  config,
  pkgs,
  ...
}:
let
  php = config.gb.home.dev.languages.php;
in
{
  options = {
    gb.home.dev.languages.php.enable = lib.mkEnableOption "Enable php language";
  };

  config = lib.mkIf php.enable {
    home.packages = [
      pkgs.php
    ];
  };
}
