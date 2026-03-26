{
  lib,
  pkgs,
  hostname,
  ...
}:
{
  imports = [
    ./nixvim/default.nix
    ./languages/default.nix
    ./tooling/default.nix
  ];

  gb.home.dev.nixvim.enable = lib.mkDefault true;
}
