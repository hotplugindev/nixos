{ config, ... }:
{
  fileSystems."/mnt/fun" = {
    device = "/dev/disk/by-uuid/f810e5a8-83ac-44f2-94d3-38d9be18a29c";
    fsType = "auto";
    options = [
      "defaults"
      "nofail"
      "x-systemd.device-timeout=5s"
      "x-gvfs-show"
    ];
  };
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
