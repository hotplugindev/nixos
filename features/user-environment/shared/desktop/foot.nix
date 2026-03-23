{ config, ... }:
let
  hostType =
    if (config.networking.hostName or "pc") == "laptop" then
      "laptop"
    else
      "desktop";
in
{
  programs.foot.enable = true;
  xdg.configFile."foot/foot.ini".source =
    if hostType == "laptop" then
      ../../../../assets/home/foot/foot-laptop.ini
    else
      ../../../../assets/home/foot/foot-pc.ini;
}
