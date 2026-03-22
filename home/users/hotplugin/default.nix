{ hostType, username, ... }:
{
  imports = [ ../../../modules/home/default.nix ];

  home.username = username;
  home.homeDirectory = "/home/${username}";

  xdg.configFile."mango/monitor.conf".source =
    if hostType == "laptop" then
      ../../../config/mango/monitor-laptop.conf
    else
      ../../../config/mango/monitor-pc.conf;

  xdg.configFile."wallpaper".source = ../../../config/wallpaper;
}
