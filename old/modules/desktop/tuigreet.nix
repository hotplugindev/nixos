{
  lib,
  config,
  pkgs,
  username,
  ...
}:

let
  tuigreetCfg = config.gb.desktop.tuigreet;
in
{
  options = {
    gb.desktop.tuigreet.enable =
      lib.mkEnableOption "Enable tuigreet";

    gb.desktop.tuigreet.autologin =
      lib.mkEnableOption "Enable greetd initial auto-login";
  };

  config = lib.mkIf tuigreetCfg.enable {
    security.pam.services.greetd.enableGnomeKeyring = true;
    services.gnome.gnome-keyring.enable = true;

    services.greetd = {
      enable = true;

      settings = {
        initial_session = lib.mkIf tuigreetCfg.autologin {
          user = username;
          command = "zsh -l -c mango";
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
              --cmd "zsh -l -c mango"
          '';
        };
      };
    };
  };
}