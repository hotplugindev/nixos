{ lib, config, pkgs, ... }:
let
  requested = config.gb.requires.system.virtualisation.libvirt != [ ];
in
{
  config = lib.mkIf requested {
    virtualisation.libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        vhostUserPackages = with pkgs; [ virtiofsd ];
      };
    };

    programs.virt-manager.enable = true;
    users.users.${config.gb.user.username}.extraGroups = [ "libvirtd" ];
    virtualisation.spiceUSBRedirection.enable = true;

    environment.systemPackages = with pkgs; [
      dnsmasq
    ];
  };
}
