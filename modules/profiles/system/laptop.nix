{ lib, config, ... }:
let
  enabled = config.gb.host.class == "laptop";
  requester = "profiles.system.laptop";
  hasTouchpad = config.gb.host.hardware.hasTouchpad;
  hasBattery = config.gb.host.hardware.hasBattery;
in
{
  config = lib.mkIf enabled {
    gb.requires.system.input.touchpad = lib.mkIf hasTouchpad [ requester ];
    gb.requires.system.firmware.fwupd = [ requester ];
    gb.requires.system.power.profiles = lib.mkIf hasBattery [ requester ];
  };
}
