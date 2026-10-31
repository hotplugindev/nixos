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

      # Explicitly route screen casting and general portal calls
      config = {
        common = {
          default = [
            "wlr"
            "gtk"
          ];
          "org.freedesktop.impl.portal.Screencast" = [ "wlr" ];
          "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
        };
      };
    };
  };
}
