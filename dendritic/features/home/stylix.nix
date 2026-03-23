{ inputs, pkgs, username, lib, ... }:
{
  home-manager.users.${username}.imports = [ inputs.stylix.homeModules.stylix ];

  home-manager.users.${username}.stylix = {
    enable = true;
    polarity = "dark";
    image = ../../../modules/home/config/wallpaper/mango.png;

    base16Scheme = {
      base00 = "1b1a17";
      base01 = "221f1a";
      base02 = "2c2722";
      base03 = "3b342d";
      base04 = "7c6f64";
      base05 = "bdae93";
      base06 = "d5c4a1";
      base07 = "ebdbb2";
      base08 = "fb4934";
      base09 = "cc3b2e";
      base0A = "babd2c";
      base0B = "95c381";
      base0C = "8baa9b";
      base0D = "83a598";
      base0E = "8d64cf";
      base0F = "c4939d";
    };

    cursor = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
      sizes = {
        terminal = 12;
        applications = 11;
        desktop = 11;
        popups = 11;
      };
    };

    opacity = {
      terminal = 1.0;
      applications = 1.0;
      desktop = 1.0;
      popups = 1.0;
    };
  };

  home-manager.users.${username}.home.sessionVariables = {
    GTK_THEME = lib.mkDefault "Adwaita:dark";
  };
}
