{ config, ... }:
{
  fileSystems."/mnt/work" = {
    device = "/dev/disk/by-uuid/1b587ad2-a133-44c9-9236-41099c41bece";
    fsType = "auto";
    options = [
      "defaults"
      "nofail"
      "x-systemd.device-timeout=5s"
      "x-gvfs-show"
    ];
  };
  systemd.tmpfiles.rules = [
    "d /mnt/fun 0755 ${config.gb.user.username} users -"
    "d /mnt/work 0755 ${config.gb.user.username} users -"
  ];
}
