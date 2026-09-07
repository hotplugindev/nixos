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
  options.gb.programs.system.noisetorch.enable = lib.mkEnableOption "Install NoiseTorch";

  config = lib.mkIf noisetorch.enable {
    programs.noisetorch.enable = true;

    gb.requires.system.audio.pipewire = [ "programs.system.noisetorch" ];
    gb.requires.system.audio.ladspa = [ "programs.system.noisetorch" ];

    systemd.user.services.noisetorch = {
      description = "NoiseTorch Auto-Load";
      after = [ "pipewire-pulse.service" ];
      wantedBy = [ "default.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.bash}/bin/bash -c 'sleep 3 && ${pkgs.noisetorch}/bin/noisetorch -i'";
        Restart = "on-failure";
      };
    };
  };
}
