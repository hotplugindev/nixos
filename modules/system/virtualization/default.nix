{
  lib,
  ...
}:
{
  imports = [
    ./docker.nix
    ./virtd.nix
  ];

  gb.system.virtualization.virtd.enable = lib.mkDefault true;

  gb.system.virtualization.docker.enable = lib.mkDefault true;
  gb.system.virtualization.docker.rootless.enable = lib.mkDefault false;
}
