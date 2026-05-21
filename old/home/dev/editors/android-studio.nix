{
  lib,
  config,
  pkgs,
  ...
}:
let
  android-studio = config.gb.home.dev.editors.android-studio;
in
{
  options = {
    gb.home.dev.editors.android-studio.enable = lib.mkEnableOption "Enable Vscode";
  };

  config = lib.mkIf android-studio.enable {
    home.packages = [
      pkgs.android-studio
    ];
  };
}
