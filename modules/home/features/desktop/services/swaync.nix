{ pkgs, ... }:
{
  systemd.user.services.swaync = {
    Unit = {
      Description = "Sway Notification Center";
      PartOf = [ "mango-session.target" ];
      After = [ "mango-session.target" ];
    };

    Install = {
      WantedBy = [ "mango-session.target" ];
    };

    Service = {
      Type = "simple";
      ExecStart = "${pkgs.swaynotificationcenter}/bin/swaync";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
      Environment = [
        "PATH=/run/current-system/sw/bin:/etc/profiles/per-user/%u/bin"
      ];
    };
  };
}
