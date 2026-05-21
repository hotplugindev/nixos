{
  lib,
  config,
  pkgs,
  ...
}:
let
  vscode = config.gb.home.dev.editors.vscode;
in
{
  options = {
    gb.home.dev.editors.vscode.enable = lib.mkEnableOption "Enable Vscode";
  };

  config = lib.mkIf vscode.enable {
    home.packages = [
      pkgs.vscode
    ];
  };
}
