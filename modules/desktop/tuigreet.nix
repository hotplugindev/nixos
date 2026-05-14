{
  lib,
  config,
  pkgs,
  ...
}:

let
  tuigreetCfg = config.gb.desktop.tuigreet;
in
{
  options = {
    gb.desktop.tuigreet.enable = lib.mkEnableOption "Enable tuigreet";
  };

  config = lib.mkIf tuigreetCfg.enable {
    services.greetd = {
      enable = true;

      settings = {
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
