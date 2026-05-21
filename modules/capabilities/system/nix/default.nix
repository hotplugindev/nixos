{ lib, ... }:
{
  imports = [
    ./optimizations.nix
    ./nixpkgs.nix
    ./autoclean.nix
    ./flakes.nix
    ./nix-command.nix
  ];

  gb.nix.flakes.enable = lib.mkDefault true;
  gb.nix.nix-command.enable = lib.mkDefault true;
  gb.nix.nixpkgs.allowunfree = lib.mkDefault true;
  gb.nix.optimizations.enable = lib.mkDefault true;
  gb.nix.autoclean.enable = lib.mkDefault true;
}
