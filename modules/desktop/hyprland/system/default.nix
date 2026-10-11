{ lib, config, ... }:
let
  hyprland = config.gb.desktop.hyprland;
in
{
  options.gb.desktop.hyprland = {
    enable = lib.mkEnableOption "Enable Hyprland desktop stack";
    autologin = lib.mkEnableOption "Enable greetd autologin for Hyprland";
  };

  config = lib.mkIf hyprland.enable {
    programs.hyprland.enable = true;
  };
}
