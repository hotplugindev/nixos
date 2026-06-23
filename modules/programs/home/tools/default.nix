{ lib, ... }:
{
  imports = [
    ./packagemanagement/default.nix
    ./filemanagment/default.nix

    ./gnome-disks.nix
  ];

  gb.home.tools.gnomeDisks.enable = lib.mkDefault true;
}
