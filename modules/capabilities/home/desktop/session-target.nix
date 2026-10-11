{ lib, config, ... }:
let
  requests = config.gb.requires.home.desktop.sessionTarget;
  startupTarget = config.gb.home.desktop.activeSessionTarget;
  custom = config.gb.home.desktop.activeCustomSessionTarget;
in
{
  config = lib.mkIf (requests != [ ] && custom) {
    systemd.user.targets.${startupTarget} = {
      Unit = {
        Description = "Desktop session target";
        BindsTo = [ "graphical-session.target" ];
        After = [ "graphical-session.target" ];
      };
    };
  };
}
