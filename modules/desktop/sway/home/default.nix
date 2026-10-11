{ lib, config, ... }:
let
  sway = config.gb.home.desktop.sway;
in
{
  options.gb.home.desktop.sway.enable = lib.mkEnableOption "Enable Sway home configuration";

  config = lib.mkIf sway.enable {
    wayland.windowManager.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      config = {
        modifier = "Mod4";
        terminal = "foot";
        menu = "wmenu run";
      };
      systemd = {
        enable = true;
        variables = [ "--all" ];
      };
    };
  };
}
