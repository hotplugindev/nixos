{ hostType, username, ... }:
{
  imports = [ ../../modules/home/default.nix ];

  home.username = username;
  home.homeDirectory = "/home/${username}";

  xdg.configFile."mango/monitor.conf".source =
    if hostType == "laptop" then
      ../../modules/home/config/mango/monitor-laptop.conf
    else
      ../../modules/home/config/mango/monitor-pc.conf;

  xdg.configFile."wallpaper".source = ../../modules/home/config/wallpaper;
}
