{
  pkgs,
  ...
}:
{
  # Core system configuration shared by every host.
  # Keep machine-specific boot/device/service overrides in modules/system/profiles/
  # (for example: secure boot, power-management, and host-only hardware toggles).

  imports = [
    ../scripts/base.nix
    ./nix-settings.nix
    ./locale.nix
    ./networking.nix
    ./user.nix
    ./security.nix
    ./audio.nix
    ./desktop.nix
    ./gaming.nix
    ./virtualization.nix
    ./fonts.nix
    ./packages.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.loader.systemd-boot.configurationLimit = 3;
}
