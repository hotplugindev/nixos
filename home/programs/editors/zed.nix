{
  lib,
  config,
  pkgs,
  ...
}:
let
  zed = config.gb.home.programs.editors.zed;
in
{
  options = {
    gb.home.programs.editors.zed.enable = lib.mkEnableOption "Enable Vscode";
  };

  config = lib.mkIf zed.enable {
    home.packages = [
      pkgs.zed-editor
    ];
  };
}
