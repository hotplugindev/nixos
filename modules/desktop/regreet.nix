{ lib, config, pkgs, ... }:

let
  regreetCfg = config.gb.desktop.regreet;
in
{
  options.gb.desktop.regreet.enable =
    lib.mkEnableOption "Enable regreet";

  config = lib.mkIf regreetCfg.enable {
    programs.regreet.enable = true;

    services.greetd.settings.default_session = {
      user = "greeter";
      command = "${pkgs.sway}/bin/sway --config /etc/greetd/sway-config";
    };

    environment.etc."greetd/sway-config".text = ''
      output DP-2 position 1920 0
      output HDMI-A-1 position 0 0

      exec "${config.programs.regreet.package}/bin/regreet; ${pkgs.sway}/bin/swaymsg exit"
    '';
  };
}