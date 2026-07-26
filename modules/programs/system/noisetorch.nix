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
  };
}
