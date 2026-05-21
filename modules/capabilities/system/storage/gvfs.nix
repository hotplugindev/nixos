{ lib, config, ... }:
let
  requested = config.gb.requires.system.storage.gvfs != [ ];
in
{
  config = lib.mkIf requested {
    services.gvfs.enable = true;
    services.udisks2.enable = true;
    services.upower.enable = true;
  };
}
