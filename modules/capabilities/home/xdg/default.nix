{ lib, config, ... }:
let
  requested = config.gb.requires.home.xdg != [ ];
in
{
  config = lib.mkIf requested {
    xdg.enable = true;
    xdg.userDirs.enable = true;
    xdg.userDirs.setSessionVariables = true;
  };
}
