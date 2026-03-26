{ lib, config, ... }:
let
  gpu = config.gb.system.graphics.gpu;
in
{
  options = {
    gb.system.graphics.gpu.enable = lib.mkEnableOption "Enable hardware Graphics for the system";
  };
  config = {
    hardware.graphics = lib.mkIf gpu.enable {
      enable = true;
      enable32Bit = true;
    };
  };
}
