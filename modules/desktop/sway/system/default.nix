{ lib, config, ... }:
let
  sway = config.gb.desktop.sway;
in
{
  options.gb.desktop.sway = {
    enable = lib.mkEnableOption "Enable Sway desktop stack";
    autologin = lib.mkEnableOption "Enable greetd autologin for Sway";
  };

  config = lib.mkIf sway.enable {
    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };

    security.pam.services.swaylock.fprintAuth = false;
  };
}
