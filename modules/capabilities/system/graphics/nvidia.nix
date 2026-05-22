{ lib, config, ... }:
let
  requested = config.gb.requires.system.graphics.nvidia != [ ];
in
{
  config = lib.mkIf requested {
    services.xserver.videoDrivers = [ "nvidia" ];
  };
}
