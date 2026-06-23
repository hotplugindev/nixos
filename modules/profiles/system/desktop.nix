{ lib, config, ... }:
let
  enabled = lib.elem "desktop" config.gb.host.roles;
  requester = "profiles.system.desktop";
  mangoEnabled = config.gb.host.desktop == "mango";
in
{
  config = lib.mkIf enabled {
    gb.desktop.mango.enable = lib.mkDefault mangoEnabled;

    gb.requires.system.desktop.mango = lib.mkIf mangoEnabled [ requester ];
    gb.requires.system.desktop.greetd = lib.mkIf mangoEnabled [ requester ];
    gb.requires.system.desktop.xdgPortal = lib.mkIf mangoEnabled [ requester ];
    gb.requires.system.desktop.xwayland = lib.mkIf mangoEnabled [ requester ];
    gb.requires.system.desktop.gnomeKeyring = lib.mkIf mangoEnabled [ requester ];
    gb.requires.system.desktop.dconf = lib.mkIf mangoEnabled [ requester ];
  };
}
