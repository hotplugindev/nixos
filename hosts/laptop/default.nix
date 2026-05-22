{ config, ... }:
{
  imports = [
    ./hardware.nix
    ./storage.nix
  ];

  gb.programs.system.steam.enable = true;

  gb.requires.system.graphics.intel = [ "hosts.laptop" ];

  gb.system.scripts.turbo-toggle.enable = true;

  networking.firewall.allowedUDPPorts = [ 7313 ];
  networking.firewall.allowedTCPPortRanges = [
    {
      from = 7314;
      to = 7320;
    }
  ];
}
