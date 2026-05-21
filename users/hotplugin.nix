{ config, ... }:
{
  home.username = config.gb.user.username;
  home.homeDirectory = "/home/${config.gb.user.username}";
}
