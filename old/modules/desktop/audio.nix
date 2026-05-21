{
  lib,
  config,
  username,
  ...
}:
let
  audio = config.gb.desktop.audio;
in
{
  options = {
    gb.desktop.audio.enable = lib.mkEnableOption "Enable audio (pipewire)";
  };
  config = lib.mkIf audio.enable {
    services.pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
    };
  };
}
