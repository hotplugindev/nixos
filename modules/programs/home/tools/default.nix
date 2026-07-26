{ lib, ... }:
{
  imports = [
    ./packagemanagement/default.nix
    ./filemanagement/default.nix
    ./audiomanagement/default.nix

    ./gnome-disks.nix
  ];

  gb.home.tools.gnomeDisks.enable = lib.mkDefault true;
}
