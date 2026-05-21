{ lib, config, ... }:
let
  requested = config.gb.requires.system.audio.pipewire != [ ];
in
{
  config = lib.mkIf requested {
    services.pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
    };
    security.rtkit.enable = true;
  };
}
