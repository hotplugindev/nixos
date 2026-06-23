{ config, lib, ... }:
{
  imports = [
    ./hardware.nix
    ./storage.nix
  ];

  gb.programs.system.steam.enable = true;
  gb.programs.system.sunshine.enable = true;
  gb.programs.system.wine.enable = true;

  gb.desktop.mango.autologin = true;

  gb.requires.system.boot.lanzaboote = [ "hosts.pc" ];
  gb.requires.system.networking.openssh = [ "hosts.pc" ];
  gb.requires.system.graphics.amd = [ "hosts.pc" ];

  users.users.${config.gb.user.username}.extraGroups = [ "uinput" ];

  networking = {
    interfaces = {
      enp42s0 = {
        wakeOnLan.enable = true;
      };
    };
    firewall = {
      allowedUDPPorts = [ 9 ];
      allowedTCPPorts = [
        22
        8080
      ];
    };
  };
}
