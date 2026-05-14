{ lib, ... }:
{
  imports = [
    ./greetd.nix
    ./mango.nix
    ./audio.nix
    ./xdg.nix
    ./dconf.nix
    ./gnome-keyring.nix
  ];
  gb.desktop.greetd.enable = lib.mkDefault true;
  gb.desktop.mango.enable = lib.mkDefault true;
  gb.desktop.audio.enable = lib.mkDefault true;
  gb.desktop.xdg.enable = lib.mkDefault true;
  gb.desktop.dconf.enable = lib.mkDefault true;
  gb.desktop.gnome-keyring.enable = lib.mkDefault true;
}
