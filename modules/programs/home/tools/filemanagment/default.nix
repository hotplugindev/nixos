{ lib, ... }:
{
  imports = [
    ./zip.nix
  ];

  gb.home.tools.filemanagment.zip.enable = lib.mkDefault true;
}
