{ lib, ... }:
{
  imports = [
    ./gpu.nix
    ./amdgpu.nix
  ];

  gb.system.graphics.gpu.enable = lib.mkDefault true;

  gb.system.graphics.gpu.amd.enable = lib.mkDefault false;

}
