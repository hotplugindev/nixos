{ pkgs, ... }:
{
  systemd.user.services.dbus-env = {
    Unit = {
      Description = "Import Wayland env into systemd user session";
      PartOf = [ "mango-session.target" ];
      After = [ "mango-session.target" ];
    };

    Service = {
      Type = "oneshot";
      ExecStart = ''
        ${pkgs.dbus}/bin/dbus-update-activation-environment --systemd \
          WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_DATA_DIRS GTK_THEME
      '';
      RemainAfterExit = true;
    };

    Install = {
      WantedBy = [ "mango-session.target" ];
    };
  };
}
