{
  lib,
  config,
  pkgs,
  ...
}:
let
  xdg = config.gb.desktop.xdg;
in
{
  options = {
    gb.desktop.xdg.enable = lib.mkEnableOption "Enable xdg for the system";
  };
  config = lib.mkIf xdg.enable {
    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
      ];
    };
  };
}
