{ config, lib, ... }:
{
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;

  services.printing.enable = false;
  services.openssh.enable = false;

  services.power-profiles-daemon.enable = true;
  services.libinput.enable = true;

  services.fwupd.enable = true;
}
