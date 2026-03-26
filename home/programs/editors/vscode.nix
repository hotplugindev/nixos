{
  lib,
  config,
  pkgs,
  ...
}:
let
  vscode = config.gb.home.programs.editors.vscode;
in
{
  options = {
    gb.home.programs.editors.vscode.enable = lib.mkEnableOption "Enable Vscode";
  };

  config = lib.mkIf vscode.enable {
    home.packages = [
      pkgs.vscode
    ];
  };
}
