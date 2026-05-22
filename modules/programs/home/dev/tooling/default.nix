{ lib, ... }:
{
  imports = [
    ./git.nix
    ./shell.nix
    ./base.nix
  ];

  gb.home.dev.tooling.git.enable = lib.mkDefault false;
  gb.home.dev.tooling.shell.enable = lib.mkDefault false;
  gb.home.dev.tooling.base.enable = lib.mkDefault false;
}
