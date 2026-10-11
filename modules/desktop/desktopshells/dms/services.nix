{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
let
  dms = config.gb.home.desktopshells.dms;
  dmsCfg = config.programs.dank-material-shell;
  dmsPackage =
    let
      legacyPackage = lib.attrByPath [ "package" ] null dmsCfg;
    in
    if legacyPackage != null then
      legacyPackage
    else
      inputs.dms.packages.${pkgs.stdenv.hostPlatform.system}.dms-shell;
  quickshellPackage = lib.attrByPath [ "quickshell" "package" ] null dmsCfg;
  runtimePath = lib.makeBinPath (
    [ dmsPackage ] ++ lib.optional (quickshellPackage != null) quickshellPackage
  );
in
{
  options.gb.home.desktopshells.dms.service = {
    enable = lib.mkEnableOption "Enable DMS startup service";

    target = lib.mkOption {
      type = lib.types.str;
      default = "graphical-session.target";
      description = "Systemd user target that gates the DMS service.";
    };
  };

  config = lib.mkMerge [
    {
      gb.home.desktopshells.dms.service.enable = lib.mkDefault dms.enable;
    }
    (lib.mkIf (dms.enable && dms.service.enable) {
      programs.dank-material-shell.systemd.enable = lib.mkForce false;

      systemd.user.services.dms = {
        Unit = {
          Description = "DankMaterialShell";
          PartOf = [ dms.service.target ];
          After = [ dms.service.target ];
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

        Install.WantedBy = [ dms.service.target ];
      };
    })
  ];
}
