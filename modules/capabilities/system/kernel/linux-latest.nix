{
  lib,
  config,
  pkgs,
  ...
}:
let
  requested = config.gb.requires.system.kernel.linuxLatest != [ ];
in
{
  config = lib.mkIf requested {
    boot.kernelPackages = pkgs.linuxPackages_latest;
  };
}
