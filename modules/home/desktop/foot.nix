{ hostType, ... }:
{
  programs.foot.enable = true;
  (if hostType == "laptop" then [ ./laptop.nix ] else [ ./pc.nix ]);
  xdg.configFile."foot/foot.ini".source = (if hostType == "laptop" then [ ../../../config/foot/foot-laptop.ini ] else [ ../../../config/foot/foot-pc.ini ]);
}
