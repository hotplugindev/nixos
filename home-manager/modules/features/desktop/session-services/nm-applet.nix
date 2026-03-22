{ pkgs, ... }:
{
  systemd.user.services.nm-applet = {
    Unit = {
      Description = "NetworkManager Applet (Mango)";
      PartOf = [ "mango-session.target" ];
      After = [
        "mango-session.target"
        "dbus-env.service"
      ];
    };

    Service = {
      ExecStart = "${pkgs.networkmanagerapplet}/bin/nm-applet --indicator";
      Restart = "on-failure";
    };

    Install = {
      WantedBy = [ "mango-session.target" ];
    };
  };
}
