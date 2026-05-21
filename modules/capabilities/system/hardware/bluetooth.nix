{ lib, config, ... }:
let
  requested = config.gb.requires.system.hardware.bluetooth != [ ];
in
{
  config = lib.mkIf requested {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = false;
    };
  };
}
