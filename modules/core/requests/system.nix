{ lib, ... }:
let
  listOption =
    description:
    lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      inherit description;
    };
in
{
  options.gb.requires.system = {
    audio.pipewire = listOption "Request PipeWire audio";
    boot.lanzaboote = listOption "Request Lanzaboote";
    kernel.linuxLatest = listOption "Request the linuxLatest Kernel";
    kernel.linuxZen = listOption "Request the linuxZen Kernel";
    compat.nixLd = listOption "Request nix-ld";
    compat.wineLibraries = listOption "Request Wine runtime libraries";
    fonts.core = listOption "Request core fonts";
    fonts.windows = listOption "Request Windows fonts";
    fonts.emoji = listOption "Request emoji fonts";
    graphics.amd = listOption "Request AMD graphics";
    graphics.intel = listOption "Request Intel graphics";
    graphics.nvidia = listOption "Request Nvidia graphics";
    input.touchpad = listOption "Request touchpad support";
    locale.glibc = listOption "Request glibc locales";
    networking.networkmanager = listOption "Request NetworkManager";
    networking.openssh = listOption "Request OpenSSH";
    networking.kdeconnect = listOption "Request KDE Connect";
    security.polkit = listOption "Request Polkit";
    storage.gvfs = listOption "Request GVFS";
    virtualisation.libvirt = listOption "Request libvirt";

    firmware.fwupd = listOption "Request fwupd";
    power.profiles = listOption "Request power profiles";
    security.gnupg = listOption "Request GnuPG";
    hardware.bluetooth = listOption "Request Bluetooth";
    virtualisation.docker = listOption "Request Docker";

    desktop.mango = listOption "Request Mango desktop stack";
    desktop.greetd = listOption "Request greetd login manager";
    desktop.xdgPortal = listOption "Request XDG portal support";
    desktop.xwayland = listOption "Request XWayland support";
    desktop.gnomeKeyring = listOption "Request GNOME Keyring";
    desktop.dconf = listOption "Request dconf";
  };
}
