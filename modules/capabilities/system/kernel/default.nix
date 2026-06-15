{
  lib,
  config,
  pkgs,
  ...
}:
let
  anyRequested = lib.any (list: list != [ ]) [
    config.gb.requires.system.kernel.linuxLatest
    config.gb.requires.system.kernel.linuxZen
  ];
in
{
  config = lib.mkIf (!anyRequested) {
    boot.kernelPackages = pkgs.linuxPackages;
  };
}
