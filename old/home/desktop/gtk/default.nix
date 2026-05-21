{ lib, ... }:
{
  imports = [
    ./theme.nix
    ./icons.nix
    ./dconf.nix
    ./packages.nix
  ];

  options = {
    gb.home.desktop.gtk.enable = lib.mkEnableOption "Enable GTK desktop integration";
  };

  config = {
    gb.home.desktop.gtk.enable = lib.mkDefault true;
    gb.home.desktop.gtk.theme.enable = lib.mkDefault true;
    gb.home.desktop.gtk.icons.enable = lib.mkDefault true;
    gb.home.desktop.gtk.dconf.enable = lib.mkDefault true;
    gb.home.desktop.gtk.packages.enable = lib.mkDefault true;
  };
}
