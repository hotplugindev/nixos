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
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];

      config = {
        # 'common' applies to all desktop sessions
        common = {
          default = [ "gtk" ];
          "org.freedesktop.impl.portal.Screencast" = [ "wlr" ];
          "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
        };
        # Explicitly target wlroots desktop session
        wlroots = {
          default = [ "gtk" ];
          "org.freedesktop.impl.portal.Screencast" = [ "wlr" ];
          "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
        };
      };
    };
  };
}
