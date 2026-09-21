{ config, ... }:
{
  fileSystems."/mnt/work" = {
    device = "/dev/disk/by-uuid/edbd16d1-1657-4fba-b697-8468338ecfb3";
    fsType = "auto";
    options = [
      "defaults"
      "nofail"
      "x-systemd.device-timeout=5s"
      "x-gvfs-show"
    ];
  };
  fileSystems."/mnt/fun" = {
    device = "/dev/disk/by-uuid/3af83927-673f-4c19-89ab-f28ca3e4b0ed";
    fsType = "auto";
    options = [
      "defaults"
      "nofail"
      "x-systemd.device-timeout=5s"
      "x-gvfs-show"
    ];
  };
  systemd.tmpfiles.rules = [
    "d /mnt/work 0755 ${config.gb.user.username} users -"
    "d /mnt/fun 0755 ${config.gb.user.username} users -"
  ];
}
