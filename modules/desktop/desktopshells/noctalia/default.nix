{
  lib,
  config,
  pkgs,
  ...
}:
let
  noctalia = config.gb.home.desktopshells.noctalia;
  tomlFormat = pkgs.formats.toml { };
  runtimePath = lib.makeBinPath [ noctalia.package ];
in
{
  options.gb.home.desktopshells.noctalia = {
    enable = lib.mkEnableOption "Enable Noctalia desktop shell";

    package = lib.mkPackageOption pkgs "noctalia" { };

    settings = lib.mkOption {
      type = tomlFormat.type;
      default = { };
      description = "Noctalia TOML configuration rendered to ~/.config/noctalia/config.toml.";
    };

    systemd.enable = (lib.mkEnableOption "Enable Noctalia systemd user service") // {
      default = true;
    };
  };

  config = lib.mkIf noctalia.enable {
    home.packages = [ noctalia.package ];

    xdg.configFile."noctalia/config.toml" = lib.mkIf (noctalia.settings != { }) {
      source = tomlFormat.generate "noctalia-config.toml" noctalia.settings;
    };

    systemd.user.services.noctalia = lib.mkIf noctalia.systemd.enable {
      Unit = {
        Description = "Noctalia";
        Documentation = [ "https://docs.noctalia.dev/noctalia/" ];
        PartOf = [ config.gb.home.desktop.activeSessionTarget ];
        After = [ config.gb.home.desktop.activeSessionTarget ];
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

      Install.WantedBy = [ config.gb.home.desktop.activeSessionTarget ];
    };
  };
}
