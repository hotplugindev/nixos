{
  lib,
  config,
  pkgs,
  ...
}:
let
  arduino-ide = config.gb.home.dev.editors.arduino-ide;
in
{
  options = {
    gb.home.dev.editors.arduino-ide.enable = lib.mkEnableOption "Enable Vscode";
  };

  config = lib.mkIf arduino-ide.enable {
    home.packages = [
      pkgs.arduino-ide
    ];
  };
}
