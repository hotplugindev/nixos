{
  lib,
  config,
  pkgs,
  ...
}:
let
  requests = config.gb.requires.system.desktop.greetd;
  cfg = config.gb.capabilities.system.desktop.greetd;
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
  };

  config = lib.mkIf (requests != [ ]) {
    security.pam.services.greetd.enableGnomeKeyring = true;

    services.greetd = {
      enable = true;
      settings = {
        initial_session = lib.mkIf cfg.autologin {
          user = cfg.autologinUser;
          command = cfg.sessionCommand;
        };
        default_session = {
          user = "greeter";
          command = ''
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
