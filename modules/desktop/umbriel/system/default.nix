{ lib, config, ... }:
let
  umbriel = config.gb.desktop.umbriel;
in
{
  options.gb.desktop.umbriel = {
    enable = lib.mkEnableOption "Enable Umbriel desktop stack";
    autologin = lib.mkEnableOption "Enable greetd autologin";
  };

  config = lib.mkIf umbriel.enable {
    programs.umbriel.enable = true;

    security.pam.services.swaylock.fprintAuth = false;
  };
}
