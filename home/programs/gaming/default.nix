{ lib, ... }:
{
  imports = [
    ./steampack.nix
    ./bottles.nix
  ];

  gb.home.programs.gaming.steampack.enable = lib.mkDefault false;
  gb.home.programs.gaming.bottles.enable = lib.mkDefault false;
}
