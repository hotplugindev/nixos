{
  pkgs,
  username,
  ...
}:
{
  #libvirtd and virt-manager
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true; # Sometimes helps with permission issues during imports
      vhostUserPackages = with pkgs; [ virtiofsd ];
    };
  };
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "${username}" ];
  virtualisation.spiceUSBRedirection.enable = true;

  # Docker
  virtualisation.docker.enable = true;
}
