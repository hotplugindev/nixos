{
  pkgs,
  lib,
  config,
  ...
}:
let
  requests = config.gb.requires.home.desktop.nextcloud;
  startupTarget = config.gb.home.desktop.mango.mangowc.startupTarget;
in
{
  config = lib.mkIf (requests != [ ]) {
    systemd.user.services.nextcloud = {
      Unit = {
        Description = "Nextcloud (Mango)";
        PartOf = [ startupTarget ];
        After = [
          startupTarget
          "dbus-env.service"
        ];
      };

      Service = {
        ExecStart = "${pkgs.nextcloud-client}/bin/nextcloud --background";
        Restart = "on-failure";
        RestartSec = 3;
      };

      Install.WantedBy = [ startupTarget ];
    };
  };
}
