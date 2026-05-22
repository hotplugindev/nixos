{
  lib,
  config,
  pkgs,
  ...
}:
let
  antigravity = config.gb.home.dev.editors.antigravity;
in
{
  options = {
    gb.home.dev.editors.antigravity.enable = lib.mkEnableOption "Enable Vscode";
  };

  config = lib.mkIf antigravity.enable {
    home.packages = [
      pkgs.antigravity
    ];
  };
}
