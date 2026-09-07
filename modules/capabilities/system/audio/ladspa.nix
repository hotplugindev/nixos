{ lib, config, pkgs, ... }:
let
  requested = config.gb.requires.system.audio.ladspa != [ ];
in
{
  config = lib.mkIf requested {
    systemd.user.services.pipewire-pulse = {
      environment = {
        LADSPA_PATH = "/tmp:${pkgs.ladspaPlugins}/lib/ladspa";
      };
    };
  };
}
