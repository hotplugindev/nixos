{
  lib,
  config,
  inputs,
  ...
}:
{
  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote
    inputs.mango.nixosModules.mango

    ../core/host/options.nix
    ../core/user/options.nix
    ../core/user/accounts.nix
    ../core/requests/system.nix
    ../core/debug/requests.nix

    ../profiles/system/workstation.nix
    ../profiles/system/desktop.nix
    ../profiles/system/laptop.nix
    ../profiles/system/gaming.nix
    ../profiles/system/development.nix

    ../capabilities/system/nix/default.nix
    ../capabilities/system/boot/systemdboot.nix
    ../capabilities/system/boot/lanzaboote.nix
    ../capabilities/system/kernel/default.nix
    ../capabilities/system/kernel/linux-latest.nix
    ../capabilities/system/kernel/linux-zen.nix
    ../capabilities/system/audio/pipewire.nix
    ../capabilities/system/compat/nix-ld.nix
    ../capabilities/system/compat/wine-libraries.nix
    ../capabilities/system/fonts/core.nix
    ../capabilities/system/fonts/windows.nix
    ../capabilities/system/fonts/emoji.nix
    ../capabilities/system/graphics/default.nix
    ../capabilities/system/graphics/amd.nix
    ../capabilities/system/graphics/intel.nix
    ../capabilities/system/graphics/nvidia.nix
    ../capabilities/system/input/touchpad.nix
    ../capabilities/system/locale/default.nix
    ../capabilities/system/locale/glibc.nix
    ../capabilities/system/networking/networkmanager.nix
    ../capabilities/system/networking/openssh.nix
    ../capabilities/system/security/polkit.nix
    ../capabilities/system/security/gnupg.nix
    ../capabilities/system/storage/gvfs.nix
    ../capabilities/system/virtualisation/libvirt.nix
    ../capabilities/system/virtualisation/docker.nix
    ../capabilities/system/firmware/fwupd.nix
    ../capabilities/system/power/power-profiles.nix
    ../capabilities/system/shell/zsh.nix
    ../capabilities/system/hardware/bluetooth.nix

    ../capabilities/system/desktop/greetd.nix
    ../capabilities/system/desktop/xdg-portal.nix
    ../capabilities/system/desktop/xwayland.nix
    ../capabilities/system/desktop/gnome-keyring.nix
    ../capabilities/system/desktop/dconf.nix

    ../programs/system/steam.nix
    ../programs/system/wine.nix
    ../programs/system/sunshine.nix
    ../programs/system/scripts/default.nix

    ../desktop/mango/system/default.nix
  ];

  config = {
    networking.hostName = config.gb.host.name;
    nixpkgs.hostPlatform = lib.mkDefault config.gb.host.system;
    system.stateVersion = "26.05";
  };
}
