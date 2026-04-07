{ lib, ... }:
{
  imports = [
    ./steampack.nix
    ./bottles.nix
    ./boxflat.nix
    ./ckan-mod-manager.nix
  ];

  gb.home.programs.gaming.steampack.enable = lib.mkDefault false;
  gb.home.programs.gaming.bottles.enable = lib.mkDefault false;
  gb.home.programs.gaming.boxflat.enable = lib.mkDefault false;
  gb.home.programs.gaming.ckan.enable = lib.mkDefault false;
}
