{ lib, ... }:
{
  imports = [
    ./git.nix
    ./avante.nix
  ];

  gb.home.dev.nixvim.tools.git.enable = lib.mkDefault true;
  gb.home.dev.nixvim.tools.avante.enable = lib.mkDefault false;
}
