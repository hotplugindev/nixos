{
  lib,
  config,
  pkgs,
  ...
}:
let
  requested = config.gb.requires.system.kernel.linuxZen != [ ];
in
{
  config = lib.mkIf requested {
    boot.kernelPackages = pkgs.linuxPackages_zen;
  };
}
