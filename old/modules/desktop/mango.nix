{ lib, config, ... }:
let
  mango = config.gb.desktop.mango;
in
{
  options = {
    gb.desktop.mango.enable = lib.mkEnableOption "Enable mango window manager";
  };
  config = lib.mkIf mango.enable {
    programs.mango.enable = true;
    security.pam.services.swaylock = {
      fprintAuth = false;
    };
  };
}
