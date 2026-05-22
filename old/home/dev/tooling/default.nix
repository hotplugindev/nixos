{ lib, ... }:
{
  imports = [
    ./git.nix
    ./shell.nix
    ./base.nix
  ];

  gb.home.dev.tooling.git.enable = lib.mkDefault true;
  gb.home.dev.tooling.shell.enable = lib.mkDefault true;
  gb.home.dev.tooling.base.enable = lib.mkDefault true;
}
