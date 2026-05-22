{
  lib,
  config,
  pkgs,
  ...
}:
let
  amdgpu = config.gb.system.graphics.gpu.amd;
in
{
  options = {
    gb.system.graphics.gpu.amd.enable = lib.mkEnableOption "Enable AMD optimization for the system";
  };
  config = {
    services.xserver.videoDrivers = lib.mkIf amdgpu.enable [ "amdgpu" ];
    hardware.amdgpu.opencl.enable = lib.mkIf amdgpu.enable true;
    environment.systemPackages = [
      pkgs.radeontop
    ];
  };
}
