{ ... }:
{
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;

  services.power-profiles-daemon.enable = true;
  services.libinput.enable = true;
}
