{
  lib,
  config,
  ...
}:
let
  mango = config.gb.home.desktop.mango;
  startupTarget = mango.mangowc.startupTarget;
  dmsPackage = config.programs.dank-material-shell.package;
  quickshellPackage = config.programs.dank-material-shell.quickshell.package;
  runtimePath = lib.makeBinPath [
    dmsPackage
    quickshellPackage
  ];
in
{
  options.gb.home.desktop.mango.services.dms.enable =
    lib.mkEnableOption "Enable DMS startup service";

  config = lib.mkIf (mango.enable && mango.dms.enable && mango.services.enable && mango.services.dms.enable) {
    programs.dank-material-shell.systemd.enable = lib.mkForce false;

    systemd.user.services.dms = {
      Unit = {
        Description = "DankMaterialShell (Mango)";
        PartOf = [ startupTarget ];
        After = [ startupTarget ];
      };

      Service = {
        Type = "simple";
        ExecStart = "${lib.getExe dmsPackage} run --session";
        Restart = "on-failure";
        RestartSec = 2;
        Environment = [
          "PATH=${runtimePath}:/run/current-system/sw/bin:/etc/profiles/per-user/%u/bin"
          "XDG_DATA_DIRS=/run/current-system/sw/share:/etc/profiles/per-user/%u/share:/usr/local/share:/usr/share"
        ];
      };

      Install.WantedBy = [ startupTarget ];
    };
  };
}
