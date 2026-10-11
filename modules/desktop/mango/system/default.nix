{ lib, config, ... }:
let
  mango = config.gb.desktop.mango;
  mangoPkg = config.programs.mango.package;
in
{
  options.gb.desktop.mango = {
    enable = lib.mkEnableOption "Enable Mango desktop stack";
    autologin = lib.mkEnableOption "Enable greetd autologin";
  };

  config = lib.mkIf mango.enable {
    programs.mango.enable = true;

    environment.etc."mango/config.conf" = {
      source = "${mangoPkg}/etc/mango/config.conf";
    };

    environment.etc."mango/config.toml" = {
      source = "${mangoPkg}/etc/mango/config.toml";
    };

    security.pam.services.swaylock.fprintAuth = false;
  };
}
