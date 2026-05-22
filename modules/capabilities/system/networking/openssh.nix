{ lib, config, ... }:
let
  requested = config.gb.requires.system.networking.openssh != [ ];
in
{
  config = lib.mkIf requested {
    services.openssh.enable = true;
  };
}
