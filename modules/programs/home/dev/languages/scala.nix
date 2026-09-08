{
  lib,
  config,
  pkgs,
  ...
}:
let
  scala = config.gb.home.dev.languages.scala;
in
{
  options = {
    gb.home.dev.languages.scala.enable = lib.mkEnableOption "Enable Scala development tools";
  };

  config = lib.mkIf scala.enable {
    home.packages = [
      pkgs.scala-cli
    ];
  };
}
