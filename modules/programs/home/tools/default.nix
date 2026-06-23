{ lib, ... }:
{
  imports = [
    ./packagemanagement/default.nix
    ./filemanagment/default.nix

    ./gparted.nix
  ];

  gb.home.tools.gparted.enable = lib.mkDefault true;
}
