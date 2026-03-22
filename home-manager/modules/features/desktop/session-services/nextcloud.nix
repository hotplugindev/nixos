{ pkgs, ... }:
{
  systemd.user.services.nextcloud = {
    Unit = {
      Description = "Nextcloud (Mango)";
      PartOf = [ "mango-session.target" ];
      After = [
        "mango-session.target"
        "dbus-env.service"
      ];
    };

    Service = {
      ExecStart = "${pkgs.nextcloud-client}/bin/nextcloud --background";
      Restart = "on-failure";
      RestartSec = 3;
    };

    Install = {
      WantedBy = [ "mango-session.target" ];
    };
  };
}
