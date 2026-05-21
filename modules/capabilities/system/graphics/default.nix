{ lib, config, ... }:
let
  anyRequested = lib.any (list: list != [ ]) [
    config.gb.requires.system.graphics.amd
    config.gb.requires.system.graphics.intel
    config.gb.requires.system.graphics.nvidia
  ];
in
{
  config = lib.mkIf anyRequested {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
