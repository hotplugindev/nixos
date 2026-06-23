{ lib, config, ... }:
let
  requested = config.gb.requires.home.networking.kdeconnect != [ ];
in
{
  config = lib.mkIf requested {
    services.kdeconnect = {
      enable = true;
      indicator = true;
    };
  };
}
