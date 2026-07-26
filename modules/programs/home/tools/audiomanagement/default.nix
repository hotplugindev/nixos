{ lib, ... }:
{
  imports = [
    ./pavucontrol.nix
  ];

  gb.home.tools.audiomanagement.pavucontrol.enable = lib.mkDefault true;
}
