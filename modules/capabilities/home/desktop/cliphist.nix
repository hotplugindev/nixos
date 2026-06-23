{
  pkgs,
  lib,
  config,
  ...
}:
let
  requests = config.gb.requires.home.desktop.cliphist;
  startupTarget = config.gb.home.desktop.mango.mangowc.startupTarget;
in
{
  config = lib.mkIf (requests != [ ]) {
    systemd.user.services.cliphist-text = {
      Unit = {
        Description = "Clipboard history (text)";
        PartOf = [ startupTarget ];
        After = [
          startupTarget
          "dbus-env.service"
        ];
      };

      Service = {
        ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --type text --watch ${pkgs.cliphist}/bin/cliphist store";
        Restart = "always";
        RestartSec = 2;
      };

      Install.WantedBy = [ startupTarget ];
    };

    systemd.user.services.cliphist-image = {
      Unit = {
        Description = "Clipboard history (image)";
        PartOf = [ startupTarget ];
        After = [
          startupTarget
          "dbus-env.service"
        ];
      };

      Service = {
        ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --type image --watch ${pkgs.cliphist}/bin/cliphist store";
        Restart = "always";
        RestartSec = 2;
      };

      Install.WantedBy = [ startupTarget ];
    };
  };
}
