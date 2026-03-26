{ lib, config, ... }:
let
  steam = config.gb.programs.steam;
in
{
  options = {
    gb.programs.steam.enable = lib.mkEnableOption "Install steam and its needed dependencies";
  };
  config = {
    programs.steam = lib.mkIf steam.enable {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    programs.gamemode.enable = lib.mkIf steam.enable true;
  };
}
