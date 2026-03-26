{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/default.nix
  ];

  networking.hostName = "laptop";

  gb.programs.steam.enable = true;

  services.printing.enable = false;
  services.openssh.enable = false;

  services.power-profiles-daemon.enable = true;
  services.libinput = {
    enable = true;

    touchpad = {
      naturalScrolling = true; # Set to false for traditional scrolling
      tapping = true; # Optional: enables tap-to-click
    };
  };

  services.fwupd.enable = true;

  networking.firewall.allowedUDPPorts = [ 7313 ];
  networking.firewall.allowedTCPPortRanges = [
    {
      from = 7314;
      to = 7320;
    }
  ];

}
