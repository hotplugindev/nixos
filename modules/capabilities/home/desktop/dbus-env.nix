{
  pkgs,
  lib,
  config,
  ...
}:
let
  requests = config.gb.requires.home.desktop.dbusEnv;
  startupTarget = config.gb.home.desktop.mango.mangowc.startupTarget;
in
{
  config = lib.mkIf (requests != [ ]) {
    systemd.user.services.dbus-env = {
      Unit = {
        Description = "Import Wayland env into systemd user session";
        PartOf = [ startupTarget ];
        After = [ startupTarget ];
      };

      Service = {
        Type = "oneshot";
        ExecStart = ''
          ${pkgs.dbus}/bin/dbus-update-activation-environment --systemd \
            WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_DATA_DIRS
        '';
        RemainAfterExit = true;
      };

      Install.WantedBy = [ startupTarget ];
    };
  };
}
