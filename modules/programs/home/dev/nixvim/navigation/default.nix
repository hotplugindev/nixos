{ lib, ... }:
{
  imports = [
    ./explorer.nix
    ./telescope.nix
  ];

  gb.home.dev.nixvim.navigation.explorer.enable = lib.mkDefault true;
  gb.home.dev.nixvim.navigation.telescope.enable = lib.mkDefault true;
}
