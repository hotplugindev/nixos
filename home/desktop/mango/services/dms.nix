{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
let
  mango = config.gb.home.desktop.mango;
  startupTarget = mango.mangowc.startupTarget;
  dmsCfg = config.programs.dank-material-shell;
  dmsPackage =
    let
      legacyPackage = lib.attrByPath [ "package" ] null dmsCfg;
    in
    if legacyPackage != null then legacyPackage else inputs.dms.packages.${pkgs.stdenv.hostPlatform.system}.dms-shell;
  quickshellPackage = lib.attrByPath [ "quickshell" "package" ] null dmsCfg;
  runtimePath = lib.makeBinPath (
    [ dmsPackage ]
    ++ lib.optional (quickshellPackage != null) quickshellPackage
  );
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
