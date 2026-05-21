{
  pkgs,
  lib,
  config,
  ...
}:
let
  mango = config.gb.home.desktop.mango;
in
{
  options.gb.home.desktop.mango.services.authAgent.enable =
    lib.mkEnableOption "Enable polkit auth agent service";

  config = lib.mkIf (mango.enable && mango.services.enable && mango.services.authAgent.enable) {
    systemd.user.services.polkit-gnome-authentication-agent-1 = {
      Unit = {
        Description = "polkit-gnome-authentication-agent-1";
        Wants = [ "graphical-session.target" ];
        After = [ "graphical-session.target" ];
      };
      Install.WantedBy = [ "graphical-session.target" ];
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
      };
    };
  };
}
