{
  config,
  lib,
  username,
  ...
}:
let
  docker = config.gb.system.virtualization.docker;
in
{
  options = {
    gb.system.virtualization.docker.enable = lib.mkEnableOption "Enable docker for the system";
    gb.system.virtualization.docker.rootless.enable = lib.mkEnableOption "Enable docker rootless";
  };

  config = lib.mkIf docker.enable {
    virtualisation.docker.enable = true;

    users.users.${username}.extraGroups = [ "docker" ];

    virtualisation.docker.rootless = lib.mkIf docker.rootless.enable {
      enable = true;
      setSocketVariable = true;
    };
  };
}
