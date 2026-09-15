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
  dmsGreeterBin = inputs.dank-greeter.packages.${pkgs.system}.dms-greeter;
  dmsGreeterRuntimePath = lib.makeBinPath [
    pkgs.quickshell
    inputs.mango.packages.${pkgs.system}.mango
    pkgs.glib
  ];
  dmsGreeterCommand = pkgs.writeShellScriptBin "dms-greeter-session" ''
    export PATH="${dmsGreeterRuntimePath}:$PATH"
    exec ${dmsGreeterBin}/bin/dms-greeter \
      --cache-dir /var/lib/dms-greeter \
      --command ${config.gb.host.desktop}
  '';
in
{
  options.gb.capabilities.system.desktop.greetd = {
    autologin = lib.mkEnableOption "Enable greetd autologin";

    autologinUser = lib.mkOption {
      type = lib.types.str;
      default = config.gb.user.username;
      description = "User for greetd autologin.";
    };

    sessionCommand = lib.mkOption {
      type = lib.types.str;
      default = "zsh -l -c mango";
      description = "Default session command for greetd.";
    };

    greeter = lib.mkOption {
      type = lib.types.enum [ "tuigreet" "dms" ];
      default = "tuigreet";
      description = "Which greeter to use for greetd.";
    };
  };

  config = lib.mkIf (requests != [ ]) {
    security.pam.services.greetd.enableGnomeKeyring = true;

    systemd.tmpfiles.settings."10-dms-greeter" = lib.mkIf (cfg.greeter == "dms") {
      "/var/lib/dms-greeter".d = {
        user = "greeter";
        group = "greeter";
        mode = "0750";
      };
    };

    services.greetd = {
      enable = true;
      settings = {
        initial_session = lib.mkIf cfg.autologin {
          user = cfg.autologinUser;
          command = cfg.sessionCommand;
        };
        default_session = {
          user = "greeter";
          command =
            if cfg.greeter == "dms" then
              ''${lib.getExe dmsGreeterCommand}''
            else
              ''
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
