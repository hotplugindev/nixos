{ lib, config, ... }:
let
  upower = config.gb.system.services.upower;
in
{
  options = {
    gb.system.services.upower.enable = lib.mkEnableOption "Enable udisks2";
  };

  config = {
    services.upower.enable = lib.mkIf upower.enable true;
  };
}
