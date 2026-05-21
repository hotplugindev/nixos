{
  lib,
  config,
  pkgs,
  ...
}:
let
  xwayland = config.gb.desktop.xwayland;
in
{
  options = {
    gb.desktop.xwayland.enable = lib.mkEnableOption "Enable xwayland";
  };
  config = lib.mkIf xwayland.enable {
    programs.xwayland.enable = true;
  };
}
