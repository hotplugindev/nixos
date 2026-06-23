{ lib, config, ... }:
let
  enabled = lib.elem "workstation" config.gb.host.roles;
  requester = "profiles.system.workstation";
in
{
  config = lib.mkIf enabled {
    gb.requires.system.networking.networkmanager = [ requester ];
    gb.requires.system.networking.kdeconnect = [ requester ];
    gb.requires.system.audio.pipewire = [ requester ];
    gb.requires.system.fonts.core = [ requester ];
    gb.requires.system.fonts.emoji = [ requester ];
    gb.requires.system.security.polkit = [ requester ];
    gb.requires.system.storage.gvfs = [ requester ];
    gb.requires.system.compat.nixLd = [ requester ];
    gb.requires.system.virtualisation.libvirt = [ requester ];
    gb.requires.system.virtualisation.docker = [ requester ];
    gb.requires.system.hardware.bluetooth = lib.mkIf config.gb.host.hardware.hasBluetooth [ requester ];
    gb.requires.system.security.gnupg = [ requester ];
    gb.requires.system.kernel.linuxZen = [ requester ];
  };
}
