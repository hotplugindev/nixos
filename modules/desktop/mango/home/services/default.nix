{ lib, config, ... }:
let
  mango = config.gb.home.desktop.mango;
  requester = "desktop.mango.services";
in
{
  config = lib.mkIf (mango.enable && mango.services.enable) {
    gb.requires.home.desktop.sessionTarget = [ requester ];
    gb.requires.home.desktop.authAgent = [ requester ];
    gb.requires.home.desktop.dbusEnv = [ requester ];
    gb.requires.home.desktop.cliphist = [ requester ];
    gb.requires.home.desktop.nextcloud = [ requester ];
  };
}
