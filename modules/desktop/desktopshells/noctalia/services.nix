{
  lib,
  config,
  ...
}:
let
  noctalia = config.gb.home.desktopshells.noctalia;
  runtimePath = lib.makeBinPath [ noctalia.package ];
in
{
  options.gb.home.desktopshells.noctalia.service = {
    enable = lib.mkEnableOption "Enable Noctalia systemd user service";

    target = lib.mkOption {
      type = lib.types.str;
      default = config.gb.home.desktop.activeSessionTarget;
      description = "Systemd user target that gates the Noctalia service. Defaults to the active compositor's session target.";
    };
  };

  config = lib.mkMerge [
    {
      gb.home.desktopshells.noctalia.service.enable = lib.mkDefault noctalia.enable;
    }
    (lib.mkIf (noctalia.enable && noctalia.service.enable) {
      systemd.user.services.noctalia = {
        Unit = {
          Description = "Noctalia";
          Documentation = [ "https://docs.noctalia.dev/noctalia/" ];
          PartOf = [ noctalia.service.target ];
          After = [ noctalia.service.target ];
        };

        Service = {
          Type = "simple";
          ExecStart = lib.getExe noctalia.package;
          Restart = "on-failure";
          RestartSec = 2;
          Environment = [
            "PATH=${runtimePath}:/run/current-system/sw/bin:/etc/profiles/per-user/%u/bin"
            "XDG_DATA_DIRS=/run/current-system/sw/share:/etc/profiles/per-user/%u/share:/usr/local/share:/usr/share"
          ];
        };

        Install.WantedBy = [ noctalia.service.target ];
      };
    })
  ];
}
