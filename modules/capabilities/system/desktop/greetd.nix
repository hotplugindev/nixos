{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
let
  requests = config.gb.requires.system.desktop.greetd;
  cfg = config.gb.capabilities.system.desktop.greetd;
  dmsEnabled = cfg.greeter == "dms";
  noctaliaEnabled = cfg.greeter == "noctalia";
  gnomeKeyringRequested = config.gb.requires.system.desktop.gnomeKeyring != [ ];
  shellCmd = if config.gb.host.shell != "none" then config.gb.host.shell else "bash";
  tomlFormat = pkgs.formats.toml { };
in
{
  imports = [ inputs.dank-greeter.nixosModules.dank-greeter ];

  options.gb.capabilities.system.desktop.greetd = {
    autologin = lib.mkEnableOption "Enable greetd autologin";

    autologinUser = lib.mkOption {
      type = lib.types.str;
      default = config.gb.user.username;
      description = "User for greetd autologin.";
    };

    sessionCommand = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Session command for greetd; provided by the active desktop profile.";
    };

    greeter = lib.mkOption {
      type = lib.types.enum [
        "tuigreet"
        "dms"
        "noctalia"
      ];
      default = "tuigreet";
      description = "Which greeter to use for greetd.";
    };

    noctalia = {
      package = lib.mkPackageOption pkgs "noctalia-greeter" { };

      settings = lib.mkOption {
        type = tomlFormat.type;
        default = { };
        description = "Declarative greeter.toml for noctalia-greeter. Written to /var/lib/noctalia-greeter/greeter.toml.";
      };
    };
  };

  config = lib.mkIf (requests != [ ]) {
    security.pam.services.greetd.enableGnomeKeyring = gnomeKeyringRequested;

    programs.dms-greeter = lib.mkIf dmsEnabled {
      enable = true;
      compositor.name = config.gb.host.desktop;
      compositor.package = inputs.mango.packages.${pkgs.stdenv.hostPlatform.system}.mango;
      quickshell.package = pkgs.quickshell;
    };

    environment.systemPackages = lib.mkIf noctaliaEnabled [ cfg.noctalia.package ];

    systemd.tmpfiles.rules = lib.mkIf noctaliaEnabled [
      "d /var/lib/noctalia-greeter 0750 greeter greeter -"
    ];

    environment.etc."noctalia-greeter/greeter.toml" = lib.mkIf (noctaliaEnabled && cfg.noctalia.settings != { }) {
      source = tomlFormat.generate "greeter.toml" cfg.noctalia.settings;
    };

    services.greetd = {
      enable = true;
      restart = true;
      settings = {
        initial_session = lib.mkIf cfg.autologin {
          user = cfg.autologinUser;
          command = cfg.sessionCommand;
        };
        default_session = {
          user = "greeter";
          command =
            if noctaliaEnabled then
              lib.mkForce ''
                ${lib.getExe cfg.noctalia.package}
              ''
            else
              lib.mkOptionDefault ''
                ${pkgs.tuigreet}/bin/tuigreet \
                  --time \
                  --remember \
                  --remember-user-session \
                  --user-menu \
                  --asterisks \
                  --cmd "${cfg.sessionCommand}"
              '';
        };
      };
    };
  };
}
