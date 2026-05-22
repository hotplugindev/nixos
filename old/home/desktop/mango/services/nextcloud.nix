{
  pkgs,
  lib,
  config,
  ...
}:
let
  mango = config.gb.home.desktop.mango;
  startupTarget = mango.mangowc.startupTarget;
in
{
  options.gb.home.desktop.mango.services.nextcloud.enable =
    lib.mkEnableOption "Enable Nextcloud service";

  config = lib.mkIf (mango.enable && mango.services.enable && mango.services.nextcloud.enable) {
    systemd.user.services.nextcloud = {
      Unit = {
        Description = "Nextcloud (Mango)";
        PartOf = [ startupTarget ];
        After = [ startupTarget "dbus-env.service" ];
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
