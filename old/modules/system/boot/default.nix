{ lib, ... }:
{
  imports = [
    ./systemdboot.nix
  ];

  gb.system.boot.systemdboot.enable = lib.mkDefault true;
  gb.system.boot.systemdboot.secure = lib.mkDefault false;

}
