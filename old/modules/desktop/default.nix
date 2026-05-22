{ lib, ... }:
{
  imports = [
    ./tuigreet.nix
    ./mango.nix
    ./audio.nix
    ./xdg.nix
    ./dconf.nix
    ./gnome-keyring.nix
    ./xwayland.nix
  ];
  gb.desktop.tuigreet.enable = lib.mkDefault true;
  gb.desktop.mango.enable = lib.mkDefault true;
  gb.desktop.audio.enable = lib.mkDefault true;
  gb.desktop.xdg.enable = lib.mkDefault true;
  gb.desktop.dconf.enable = lib.mkDefault true;
  gb.desktop.xwayland.enable = lib.mkDefault true;
  gb.desktop.gnome-keyring.enable = lib.mkDefault true;
}
