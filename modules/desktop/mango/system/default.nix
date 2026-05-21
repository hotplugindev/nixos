{ lib, config, pkgs, ... }:
let
  mango = config.gb.desktop.mango;
  shellCmd = if config.gb.host.shell != "none" then config.gb.host.shell else "zsh";
  mangoCommand = "${shellCmd} -l -c mango";
in
{
  options.gb.desktop.mango = {
    enable = lib.mkEnableOption "Enable Mango desktop stack";
    autologin = lib.mkEnableOption "Enable greetd autologin";
  };

  config = lib.mkIf mango.enable {
    programs.mango.enable = true;

    security.pam.services.swaylock.fprintAuth = false;
    programs.dconf.enable = true;
    services.gnome.gnome-keyring.enable = true;

    programs.xwayland.enable = true;

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
      ];
    };

    security.pam.services.greetd.enableGnomeKeyring = true;

    services.greetd = {
      enable = true;
      settings = {
        initial_session = lib.mkIf mango.autologin {
          user = config.gb.user.username;
          command = mangoCommand;
        };
        default_session = {
          user = "greeter";
          command = ''
            ${pkgs.tuigreet}/bin/tuigreet \
              --time \
              --remember \
              --remember-user-session \
              --user-menu \
              --asterisks \
              --cmd "${mangoCommand}"
          '';
        };
      };
    };
  };
}
