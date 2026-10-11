{ lib, config, ... }:
let
  enabled = lib.elem "desktop" config.gb.host.roles;
  requester = "profiles.home.desktop";
  mangoEnabled = config.gb.host.desktop == "mango";
  dmsEnabled = config.gb.host.desktopShell == "dms";
in
{
  config = lib.mkIf enabled {
    gb.requires.home.theme = [ requester ];
    gb.requires.home.xdg = [ requester ];
    gb.requires.home.terminal = [ requester ];

    gb.home.desktop.mango.enable = lib.mkDefault mangoEnabled;
    gb.home.desktopshells.dms.enable = lib.mkDefault dmsEnabled;

    gb.requires.home.desktop.mango = lib.mkIf mangoEnabled [ requester ];
    gb.requires.home.desktopshells.dms = lib.mkIf dmsEnabled [ requester ];
    gb.requires.home.desktop.sessionTarget = lib.mkIf mangoEnabled [ requester ];
    gb.requires.home.desktop.authAgent = lib.mkIf mangoEnabled [ requester ];
    gb.requires.home.desktop.dbusEnv = lib.mkIf mangoEnabled [ requester ];
    gb.requires.home.desktop.cliphist = lib.mkIf mangoEnabled [ requester ];
    gb.requires.home.desktop.nextcloud = lib.mkIf mangoEnabled [ requester ];
  };
}
