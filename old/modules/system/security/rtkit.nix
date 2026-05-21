{ lib, config, ... }:
let
  rtkit = config.gb.system.security.rtkit;
in
{
  options = {
    gb.system.security.rtkit.enable = lib.mkEnableOption "Enable rtkit";
  };

  config = lib.mkIf rtkit.enable {
    security.rtkit.enable = true;
  };
}
