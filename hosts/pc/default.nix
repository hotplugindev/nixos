{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/default.nix
  ];

  networking.hostName = "pc";

  gb.system.boot.systemdboot.secure = true;

  gb.system.graphics.gpu.amd.enable = true;

  gb.programs.steam.enable = true;

  services.printing.enable = false;
  services.openssh.enable = true;
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
