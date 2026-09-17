{ lib, config, ... }:
let
  enabled = lib.elem "workstation" config.gb.host.roles;
  requester = "profiles.home.workstation";
in
{
  config = lib.mkIf enabled {
    gb.requires.home.networking.kdeconnect = [ requester ];

    gb.home.programs.multimedia.spotify.enable = lib.mkDefault true;
    gb.home.programs.multimedia.showtime.enable = lib.mkDefault true;
    gb.home.programs.productivity.obsidian.enable = lib.mkDefault true;
    gb.home.programs.productivity.logseq.enable = lib.mkDefault true;
    gb.home.programs.productivity.onlyoffice.enable = lib.mkDefault true;
    gb.home.programs.productivity.gimp.enable = lib.mkDefault true;
    gb.home.programs.productivity.nextcloud.enable = lib.mkDefault true;
    gb.home.programs.productivity.bitwarden.enable = lib.mkDefault true;
    gb.home.tools.gnomeDisks.enable = lib.mkDefault true;
    gb.home.programs.web.brave.enable = lib.mkDefault true;
    gb.home.programs.web.firefox.enable = lib.mkDefault true;
    gb.home.programs.communication.discord.enable = lib.mkDefault true;
  };
}
