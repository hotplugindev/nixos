{ lib, ... }:
{
  imports = [
    ./gnome.nix
    ./mango.nix
    ./audio.nix
    ./xdg.nix
  ];
  gb.desktop.gnome.enable = lib.mkDefault true;
  gb.desktop.mango.enable = lib.mkDefault true;
  gb.desktop.audio.enable = lib.mkDefault true;
  gb.desktop.xdg.enable = lib.mkDefault true;
}
