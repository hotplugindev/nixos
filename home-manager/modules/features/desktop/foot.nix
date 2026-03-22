{ hostType, ... }:
{
  programs.foot.enable = true;
  xdg.configFile."foot/foot.ini".source =
    if hostType == "laptop" then
      ../../../../assets/desktop/foot/hosts/laptop/foot.ini
    else
      ../../../../assets/desktop/foot/hosts/pc/foot.ini;
}
