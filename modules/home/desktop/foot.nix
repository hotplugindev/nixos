{ hostType, ... }:
{
  programs.foot.enable = true;
  xdg.configFile."foot/foot.ini".source = if hostType == "laptop" then ../../../config/foot/foot-laptop.ini else ../../../config/foot/foot-pc.ini;
}
