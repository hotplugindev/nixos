{ lib, config, ... }:
let
  gnome = config.gb.desktop.gnome;
in
{
  options = {
    gb.desktop.gnome.enable = lib.mkEnableOption "Enable the gnome desktop environment";
  };
  config = {
    services.displayManager.gdm.enable = lib.mkIf gnome.enable true;
    services.desktopManager.gnome.enable = lib.mkIf gnome.enable true;
  };
}
