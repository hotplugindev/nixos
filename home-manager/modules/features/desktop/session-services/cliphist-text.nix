{ pkgs, ... }:
{
  systemd.user.services.cliphist-text = {
    Unit = {
      Description = "Clipboard history (text)";
      PartOf = [ "mango-session.target" ];
      After = [
        "mango-session.target"
        "dbus-env.service"
      ];
    };

    Service = {
      ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --type text --watch ${pkgs.cliphist}/bin/cliphist store";
      Restart = "always";
      RestartSec = 2;
    };

    Install = {
      WantedBy = [ "mango-session.target" ];
    };
  };
}
