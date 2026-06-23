{ lib, config, ... }:
let
  requested = config.gb.requires.home.desktop.dmsPlugins.kdeconnect != [ ];
  dmsEnabled = config.gb.home.desktop.mango.enable && config.gb.home.desktop.mango.dms.enable;
in
{
  config = lib.mkIf (requested && dmsEnabled) {
    services.kdeconnect = {
      enable = true;
      indicator = true;
    };

    programs.dank-material-shell = {
      plugins.dankKDEConnect.enable = true;
    };
  };
}
