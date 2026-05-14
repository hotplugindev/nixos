{
  lib,
  config,
  pkgs,
  username,
  ...
}:

let
  tuigreetCfg = config.gb.desktop.tuigreet;
in
{
  options = {
    gb.desktop.tuigreet.enable = lib.mkEnableOption "Enable tuigreet";
    gb.desktop.tuigreet.autologin = lib.mkEnableOption "Enable auto login";
  };

  config = lib.mkIf tuigreetCfg.enable {
    services.greetd = {
      enable = true;

      settings = {
        initial_session = lib.mkIf tuigreetCfg.autologin {
          user = username;
          command = "${pkgs.mangowc}/bin/mango";
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
              --cmd ${pkgs.mangowc}/bin/mango
          '';
        };
      };
    };
  };
}
