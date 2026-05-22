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
  options.gb.home.desktop.mango.services.cliphist.enable =
    lib.mkEnableOption "Enable cliphist ingest services";

  config = lib.mkIf (mango.enable && mango.services.enable && mango.services.cliphist.enable) {
    systemd.user.services.cliphist-text = {
      Unit = {
        Description = "Clipboard history (text)";
        PartOf = [ startupTarget ];
        After = [ startupTarget "dbus-env.service" ];
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
        After = [ startupTarget "dbus-env.service" ];
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
