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
  options.gb.home.desktop.mango.services.dbusEnv.enable =
    lib.mkEnableOption "Enable dbus environment import service";

  config = lib.mkIf (mango.enable && mango.services.enable && mango.services.dbusEnv.enable) {
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
