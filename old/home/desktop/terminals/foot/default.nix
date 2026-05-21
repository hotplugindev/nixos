{ lib, ... }:
{
  imports = [
    ./settings.nix
  ];

  gb.home.desktop.terminals.foot.enable = lib.mkDefault true;
}
