{ lib, config, ... }:
let
  requested = config.gb.requires.system.firmware.fwupd != [ ];
in
{
  config = lib.mkIf requested {
    services.fwupd.enable = true;
  };
}
