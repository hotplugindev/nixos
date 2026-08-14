{ config, ... }:
{
  imports = [
    ./hardware.nix
    ./storage.nix
  ];

  gb.programs.system.steam.enable = true;

  gb.requires.system.graphics.intel = [ "hosts.laptop" ];

  gb.system.scripts.turbo-toggle.enable = true;

  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTR{idVendor}=="2341", ATTR{idProduct}=="0364", MODE="0666"
  '';

  networking.firewall.allowedUDPPorts = [ 7313 ];
  networking.firewall.allowedTCPPortRanges = [
    {
      from = 7314;
      to = 7320;
    }
  ];
}
