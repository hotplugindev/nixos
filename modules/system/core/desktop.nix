{ pkgs, ... }:
{
  programs.mango.enable = true;

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true; # needed for Steam / Wine
  };

  # XDG Portals
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };

  services.gvfs.enable = true;
  services.udisks2.enable = true;
}
