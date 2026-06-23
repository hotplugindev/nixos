{ lib, config, ... }:
let
  requests = config.gb.requires.system.desktop.gnomeKeyring;
in
{
  config = lib.mkIf (requests != [ ]) {
    services.gnome.gnome-keyring.enable = true;
  };
}
