{ lib, ... }:
{
  imports = [
    ./options.nix
    ./autocmds.nix
  ];

  gb.home.dev.nixvim.core.options.enable = lib.mkDefault true;
  gb.home.dev.nixvim.core.autocmds.enable = lib.mkDefault true;
}
