{ lib, config, ... }:
let
  requested = config.gb.requires.system.security.polkit != [ ];
in
{
  config = lib.mkIf requested {
    security.polkit.enable = true;
  };
}
