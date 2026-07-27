{
  lib,
  config,
  pkgs,
  ...
}:
let
  noisetorch = config.gb.programs.system.noisetorch;
in
{
  options.gb.programs.system.noisetorch.enable = lib.mkEnableOption "Install Steam";

  config = lib.mkIf noisetorch.enable {
    programs.noisetorch.enable = true;

    systemd.user.services.pipewire-pulse = {
      environment = {
        LADSPA_PATH = "/tmp:${pkgs.ladspaPlugins}/lib/ladspa";
      };
    };
    systemd.user.services.noisetorch = {
      description = "NoiseTorch Auto-Load";
      after = [ "pipewire-pulse.service" ];
      wantedBy = [ "default.target" ];
      serviceConfig = {
        Type = "simple";
        # Waits 3 seconds for PipeWire to find your mic, then auto-loads default input
        ExecStart = "${pkgs.bash}/bin/bash -c 'sleep 3 && ${pkgs.noisetorch}/bin/noisetorch -i'";
        Restart = "on-failure";
      };
    };
  };
}
