{ lib, config, ... }:
let
  steam = config.gb.programs.system.steam;
in
{
  options.gb.programs.system.steam.enable = lib.mkEnableOption "Install Steam";

  config = lib.mkIf steam.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };

    gb.requires.system.fonts.core = [ "programs.system.steam" ];
    gb.requires.system.gaming.gamemode = [ "programs.system.steam" ];
  };
}
