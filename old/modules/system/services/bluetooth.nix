{ lib, config, ... }:
let
  bluetooth = config.gb.system.services.bluetooth;
in
{
  options = {
    gb.system.services.bluetooth.enable = lib.mkEnableOption "Enable udisks2";
  };

  config = {
    hardware.bluetooth = lib.mkIf bluetooth.enable {
      enable = true;
      powerOnBoot = false;
    };
  };
}
