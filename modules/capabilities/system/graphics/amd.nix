{
  lib,
  config,
  pkgs,
  ...
}:
let
  requested = config.gb.requires.system.graphics.amd != [ ];
in
{
  config = lib.mkIf requested {
    services.xserver.videoDrivers = [ "amdgpu" ];
    hardware.amdgpu.opencl.enable = true;
    environment.systemPackages = [ pkgs.radeontop ];
  };
}
