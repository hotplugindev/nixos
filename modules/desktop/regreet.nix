{ lib, config, pkgs, ... }:

let
  regreetCfg = config.gb.desktop.regreet;
in
{
  options.gb.desktop.regreet.enable =
    lib.mkEnableOption "Enable regreet";

  config = lib.mkIf regreetCfg.enable {
    programs.regreet.enable = true;

    services.greetd = {
      enable = true;
      settings.default_session = {
        user = "greeter";
        command = "${pkgs.mangowc}/bin/mango -s '${config.programs.regreet.package}/bin/regreet'";
      };
    };
  };
}