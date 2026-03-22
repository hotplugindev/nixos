{ hostType, ... }:
{
  programs.foot.enable = true;
  xdg.configFile."foot/foot.ini".source = if hostType == "pc" then ../../../config/foot/foot-pc.ini else ../../../config/foot/foot-laptop.ini;
}
