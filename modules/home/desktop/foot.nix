{ ... }:
{
  programs.foot.enable = true;
  xdg.configFile."foot/foot.ini".source = ../../../config/foot/foot.ini;
}
