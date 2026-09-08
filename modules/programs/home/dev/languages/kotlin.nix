{
  lib,
  config,
  pkgs,
  ...
}:
let
  kotlin = config.gb.home.dev.languages.kotlin;
in
{
  options = {
    gb.home.dev.languages.kotlin.enable = lib.mkEnableOption "Enable Kotlin development tools";
  };

  config = lib.mkIf kotlin.enable {
    home.packages = [
      pkgs.kotlin
    ];
  };
}
