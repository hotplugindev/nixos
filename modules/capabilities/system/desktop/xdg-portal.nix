{
  lib,
  config,
  pkgs,
  ...
}:
let
  requests = config.gb.requires.system.desktop.xdgPortal;
in
{
  config = lib.mkIf (requests != [ ]) {
    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
      ];
    };
  };
}
