{
  lib,
  config,
  pkgs,
  username,
  ...
}:

let
  regreetCfg = config.gb.desktop.regreet;
in
{
  options = {
    gb.desktop.regreet.enable = lib.mkEnableOption "Enable regreet";
    gb.desktop.regreet.autologin = lib.mkEnableOption "Enable auto login";
  };

  config = lib.mkIf regreetCfg.enable {
    programs.regreet.enable = true;

    services.greetd = {
      enable = true;

      settings = {
        initial_session = lib.mkIf regreetCfg.autologin {
          user = username;
          command = "sleep 2 && ${pkgs.mangowc}/bin/mango";
        };

        default_session = {
          user = "greeter";
          command = "${pkgs.mangowc}/bin/mango -s '${config.programs.regreet.package}/bin/regreet'";
        };
      };
    };
  };
}
