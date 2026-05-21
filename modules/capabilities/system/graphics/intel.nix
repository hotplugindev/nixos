{ lib, config, ... }:
let
  requested = config.gb.requires.system.graphics.intel != [ ];
in
{
  config = lib.mkIf requested {
    services.xserver.videoDrivers = [ "intel" ];
  };
}
