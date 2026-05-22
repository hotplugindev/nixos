{ lib, config, ... }:
let
  requested = config.gb.requires.system.networking.networkmanager != [ ];
in
{
  config = lib.mkIf requested {
    networking.networkmanager.enable = true;
    users.users.${config.gb.user.username}.extraGroups = [ "networkmanager" ];
    networking.firewall.enable = true;
  };
}
