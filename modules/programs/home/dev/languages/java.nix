{
  lib,
  config,
  pkgs,
  ...
}:
let
  java = config.gb.home.dev.languages.java;
in
{
  options = {
    gb.home.dev.languages.java.enable = lib.mkEnableOption "Enable Java development tools";
  };

  config = lib.mkIf java.enable {
    home.packages = [
      pkgs.jdk
    ];
  };
}
