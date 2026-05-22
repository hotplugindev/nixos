{
  lib,
  config,
  pkgs,
  ...
}:
let
  discord = config.gb.home.programs.communication.discord;
in
{
  options = {
    gb.home.programs.communication.discord.enable = lib.mkEnableOption "Enable discord";
  };

  config = lib.mkIf discord.enable {
    home.packages = [
      pkgs.discord
    ];
  };
}
