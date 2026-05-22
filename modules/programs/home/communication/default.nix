{ lib, ... }:
{
  imports = [
    ./discord.nix
    ./element.nix
  ];

  gb.home.programs.communication.discord.enable = lib.mkDefault true;
  gb.home.programs.communication.element.enable = lib.mkDefault true;
}
