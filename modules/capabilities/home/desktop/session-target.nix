{ lib, config, ... }:
let
  requests = config.gb.requires.home.desktop.sessionTarget;
  startupTarget = config.gb.home.desktop.mango.mangowc.startupTarget;
in
{
  config = lib.mkIf (requests != [ ]) {
    systemd.user.targets.${startupTarget} = {
      Unit = {
        Description = "Mango desktop session target";
        BindsTo = [ "graphical-session.target" ];
        After = [ "graphical-session.target" ];
      };
    };
  };
}
