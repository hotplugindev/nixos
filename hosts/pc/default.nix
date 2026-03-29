{ username, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/default.nix
  ];

  networking.hostName = "pc";

  gb.system.boot.systemdboot.secure = true;

  gb.system.graphics.gpu.amd.enable = true;

  gb.programs.steam.enable = true;

  services.printing.enable = false;
  services.openssh.enable = true;
  networking = {
    interfaces = {
      enp42s0 = {
        wakeOnLan.enable = true;
      };
    };
    firewall = {
      allowedUDPPorts = [ 9 ];
      allowedTCPPorts = [
        22
        8080
      ];
    };
  };

  fileSystems."/home/2nd" = {
    device = "/dev/disk/by-uuid/f810e5a8-83ac-44f2-94d3-38d9be18a29c";
    fsType = "auto";
    options = [
      "nofail" # Boots even if drive is missing
      "x-systemd.device-timeout=5s"
      "x-gvfs-show" # <--- This makes it appear in the File Browser sidebar
      "rw"
      "exec"
      "user" # Allows your user to interact with the mount
    ];
  };
  fileSystems."/mnt/3nd" = {
    device = "/dev/disk/by-uuid/1b587ad2-a133-44c9-9236-41099c41bece";
    fsType = "auto";
    options = [
      "nofail" # Boots even if drive is missing
      "x-systemd.device-timeout=5s"
      "x-gvfs-show" # <--- This makes it appear in the File Browser sidebar
      "rw"
      "exec"
      "user" # Allows your user to interact with the mount
    ];
  };
  systemd.tmpfiles.rules = [
    "d /mnt/2nd 0755 ${username} users -"
    "d /mnt/3nd 0755 ${username} users -"
  ];
}
