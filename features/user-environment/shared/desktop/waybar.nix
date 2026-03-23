{ pkgs, ... }:

{
  programs.waybar.enable = true;

  xdg.configFile."waybar/config.jsonc".source = ../../../../assets/home/waybar/config.jsonc;
  xdg.configFile."waybar/style.css".source = ../../../../assets/home/waybar/style.css;
}