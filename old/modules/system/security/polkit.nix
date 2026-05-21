{ lib, config, ... }:
let
  polkit = config.gb.system.security.polkit;
in
{
  options = {
    gb.system.security.polkit.enable = lib.mkEnableOption "Enable polkit";
  };

  config = lib.mkIf polkit.enable {
    security.polkit.enable = true;
  };
}
