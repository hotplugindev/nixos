{ lib, config, ... }:
let
  mango = config.gb.home.desktop.mango;
in
{
  imports = [
    ./session-target.nix
    ./auth-agent.nix
    ./dbus-env.nix
    ./cliphist.nix
    ./nextcloud.nix
  ];

  config = {
    gb.home.desktop.mango.services.enable = lib.mkDefault (mango.enable && mango.mangowc.enable);
    gb.home.desktop.mango.services.sessionTarget.enable = lib.mkDefault mango.services.enable;
    gb.home.desktop.mango.services.authAgent.enable = lib.mkDefault mango.services.enable;
    gb.home.desktop.mango.services.dbusEnv.enable = lib.mkDefault mango.services.enable;
    gb.home.desktop.mango.services.cliphist.enable = lib.mkDefault mango.services.enable;
    gb.home.desktop.mango.services.nextcloud.enable = lib.mkDefault mango.services.enable;
  };
}
