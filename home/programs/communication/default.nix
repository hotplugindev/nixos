{ lib, ... }:
{
  imports = [
    ./discord.nix
  ];

  gb.home.programs.communication.discord.enable = lib.mkDefault true;
}
