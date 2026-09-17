{ lib, ... }:
{
  imports = [
    ./packagemanagement/default.nix
    ./filemanagement/default.nix
    ./audiomanagement/default.nix

    ./gnome-disks.nix
  ];
}
