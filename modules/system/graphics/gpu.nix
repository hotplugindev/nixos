{
  lib,
  config,
  pkgs,
  ...
}:
let
  gpu = config.gb.system.graphics.gpu;
in
{
  options = {
    gb.system.graphics.gpu.enable = lib.mkEnableOption "Enable hardware Graphics for the system";
  };
  config = {
    environment.variables = {
      RUSTICL_ENABLE = "radeonsi";
    };
    hardware.graphics = lib.mkIf gpu.enable {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        mesa.opencl # Enables Rusticl (OpenCL) support
      ];
    };
  };
}
