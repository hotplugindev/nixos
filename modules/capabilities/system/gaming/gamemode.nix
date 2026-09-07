{ lib, config, ... }:
let
  requested = config.gb.requires.system.gaming.gamemode != [ ];
in
{
  config = lib.mkIf requested {
    programs.gamemode.enable = true;
  };
}
