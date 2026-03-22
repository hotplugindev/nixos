{ pkgs, lib, ... }:
{
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = lib.mkForce false;

  services.printing.enable = false;
  services.openssh.enable = true;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
    autoGenerateKeys.enable = true;
  };

  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.amdgpu.opencl.enable = true;

  environment.systemPackages = with pkgs; [
    sbctl
  ];
}
