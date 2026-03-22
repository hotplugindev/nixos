{ pkgs, ... }:

{
  programs.waybar.enable = true;

  xdg.configFile."waybar/config.jsonc".source = ../../../../assets/desktop/waybar/config.jsonc;
  xdg.configFile."waybar/style.css".source = ../../../../assets/desktop/waybar/style.css;
}
