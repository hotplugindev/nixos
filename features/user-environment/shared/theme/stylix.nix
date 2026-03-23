{ pkgs, inputs, ... }:
{
  imports = [ inputs.stylix.homeModules.stylix ];

  stylix = {
    enable = true;
    autoEnable = true;

    image = ../../../../assets/home/wallpaper/mango.png;

    polarity = "dark";
    base16Scheme = {
      base00 = "1b1a17";
      base01 = "221f1a";
      base02 = "2c2722";
      base03 = "3b342d";
      base04 = "7c6f64";
      base05 = "ebdbb2";
      base06 = "d5c4a1";
      base07 = "f9f5d7";
      base08 = "cc3b2e";
      base09 = "d79921";
      base0A = "fabd2f";
      base0B = "95c381";
      base0C = "8baa9b";
      base0D = "8d64cf";
      base0E = "c4939d";
      base0F = "ad401f";
    };

    cursor = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Propo";
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
        applications = 12;
        desktop = 12;
        popups = 12;
        terminal = 12;
      };
    };

    opacity = {
      applications = 0.85;
      desktop = 0.85;
      popups = 0.85;
      terminal = 0.7;
    };
  };
}
