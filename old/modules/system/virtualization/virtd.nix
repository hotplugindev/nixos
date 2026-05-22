{
  config,
  lib,
  pkgs,
  username,
  ...
}:
let
  virtd = config.gb.system.virtualization.virtd;
in
{
  options = {
    gb.system.virtualization.virtd.enable = lib.mkEnableOption "Enable virtd, qemu and virt-manager";
  };

  config = lib.mkIf virtd.enable {
    virtualisation.libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true; # Sometimes helps with permission issues during imports
        vhostUserPackages = with pkgs; [ virtiofsd ];
      };
    };

    programs.virt-manager.enable = true;
    users.users.${username}.extraGroups = [ "libvirtd" ];
    virtualisation.spiceUSBRedirection.enable = true;

    environment.systemPackages = with pkgs; [
      dnsmasq
    ];
  };
}
