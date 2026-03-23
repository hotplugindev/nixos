{ pkgs, ... }:
{
  systemd.user.services.cliphist-image = {
    Unit = {
      Description = "Clipboard history (image)";
      PartOf = [ "mango-session.target" ];
      After = [
        "mango-session.target"
        "dbus-env.service"
      ];
    };

    Service = {
      ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --type image --watch ${pkgs.cliphist}/bin/cliphist store";
      Restart = "always";
      RestartSec = 2;
    };

    Install = {
      WantedBy = [ "mango-session.target" ];
    };
  };
}
