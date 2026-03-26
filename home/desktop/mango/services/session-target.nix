{ lib, config, ... }:
let
  mango = config.gb.home.desktop.mango;
  startupTarget = mango.mangowc.startupTarget;
in
{
  options.gb.home.desktop.mango.services.sessionTarget.enable =
    lib.mkEnableOption "Enable Mango session target";

  config = lib.mkIf (mango.enable && mango.services.enable && mango.services.sessionTarget.enable) {
    systemd.user.targets.${startupTarget} = {
      Unit = {
        Description = "Mango desktop session target";
        BindsTo = [ "graphical-session.target" ];
        After = [ "graphical-session.target" ];
      };
    };
  };
}
