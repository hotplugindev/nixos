{ lib, ... }:
{
  imports = [
    ./zsh.nix
    ./steam.nix
    ./nix-ld.nix
  ];

  gb.programs.zsh.enable = lib.mkDefault true;
  gb.programs.zsh.user-shell = lib.mkDefault true;

  gb.programs.nix-ld.enable = lib.mkDefault true;

  gb.programs.steam.enable = lib.mkDefault false;
}
