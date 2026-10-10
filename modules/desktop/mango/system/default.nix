{ lib, config, pkgs, ... }:
let
  mango = config.gb.desktop.mango;
  shellCmd = if config.gb.host.shell != "none" then config.gb.host.shell else "zsh";
  mangoCommand = "${shellCmd} -l -c mango";
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

    gb.requires.system.desktop.greetd = [ "desktop.mango" ];
    gb.requires.system.desktop.xdgPortal = [ "desktop.mango" ];
    gb.requires.system.desktop.xwayland = [ "desktop.mango" ];
    gb.requires.system.desktop.gnomeKeyring = [ "desktop.mango" ];
    gb.requires.system.desktop.dconf = [ "desktop.mango" ];

    gb.capabilities.system.desktop.greetd = {
      autologin = lib.mkDefault mango.autologin;
      sessionCommand = lib.mkDefault mangoCommand;
    };
  };
}
