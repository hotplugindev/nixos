{ pkgs, ... }:
{
  systemd.user.services.waybar = {
    Unit = {
      Description = "Waybar (Mango)";
      PartOf = [ "mango-session.target" ];
      After = [
        "mango-session.target"
        "dbus-env.service"
      ];
    };

    Service = {
      ExecStart = "${pkgs.waybar}/bin/waybar";
      Restart = "on-failure";
      RestartSec = 2;
      Environment = [
        "PATH=/run/current-system/sw/bin:/etc/profiles/per-user/%u/bin"
        "XDG_DATA_DIRS=/run/current-system/sw/share:/etc/profiles/per-user/%u/share:/usr/local/share:/usr/share"
      ];
    };

    Install = {
      WantedBy = [ "mango-session.target" ];
    };
  };
}
