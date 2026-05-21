{ lib, config, ... }:
let
  requested = config.gb.requires.system.virtualisation.docker != [ ];
in
{
  config = lib.mkIf requested {
    virtualisation.docker.enable = true;
    users.users.${config.gb.user.username}.extraGroups = [ "docker" ];
    virtualisation.docker.rootless = {
      enable = false;
      setSocketVariable = true;
    };
  };
}
