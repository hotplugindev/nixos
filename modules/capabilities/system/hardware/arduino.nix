{ lib, config, ... }:
let
  requested = config.gb.requires.system.hardware.arduino != [ ];
in
{
  config = lib.mkIf requested {
    services.udev.extraRules = ''
      SUBSYSTEM=="usb", ATTR{idVendor}=="2341", ATTR{idProduct}=="0364", MODE="0666"
    '';
  };
}
