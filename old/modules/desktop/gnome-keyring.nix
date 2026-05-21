{ lib, config, ... }:
let
  keyringCfg = config.gb.desktop.gnome-keyring;
in
{
  options = {
    gb.desktop.gnome-keyring.enable = lib.mkEnableOption "Enable gnome-keyring";
  };
  config = lib.mkIf keyringCfg.enable {
    services.gnome.gnome-keyring.enable = true;
  };
}