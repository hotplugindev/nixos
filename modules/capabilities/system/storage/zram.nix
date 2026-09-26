{ lib, config, ... }:
let
  requested = config.gb.requires.system.storage.zram != [ ];
in
{
  config = lib.mkIf requested {
    zramSwap.enable = true;
    zramSwap.memoryPercent = 50;
  };
}
