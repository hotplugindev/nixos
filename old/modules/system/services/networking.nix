{
  lib,
  config,
  username,
  ...
}:
let
  networking = config.gb.system.services.networking;
in
{
  options = {
    gb.system.services.networking.enable = lib.mkEnableOption "Enable networking (networkmanager)";
  };

  config = lib.mkIf networking.enable {
    networking.networkmanager.enable = true;
    users.users.${username}.extraGroups = [ "networkmanager" ];
    networking.firewall.enable = true;
  };
}
