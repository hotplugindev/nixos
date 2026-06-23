{
  lib,
  config,
  pkgs,
  ...
}:
let
  requested = config.gb.requires.home.theme != [ ];
  theme = config.gb.home.theme;
  gtkTheme = theme.gtk.theme;
  gtkIcons = theme.gtk.icons;
  gtkPackages = theme.gtk.packages;
  fonts = theme.fonts;
in
{
  options.gb.home.theme = {
    gtk = {
      theme = {
        name = lib.mkOption {
          type = lib.types.str;
          default = "Adwaita-dark";
          description = "GTK theme name";
        };
        package = lib.mkOption {
          type = lib.types.package;
          default = pkgs.gnome-themes-extra;
          description = "Package providing GTK theme";
        };
      };
      icons = {
        name = lib.mkOption {
          type = lib.types.str;
          default = "Papirus-Dark";
          description = "GTK icon theme name";
        };
        package = lib.mkOption {
          type = lib.types.package;
          default = pkgs.papirus-icon-theme;
          description = "Package providing icon theme";
        };
      };
      packages = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = with pkgs; [
          papirus-icon-theme
          adwaita-icon-theme
          hicolor-icon-theme
        ];
        description = "GTK supporting packages";
      };
    };
    fonts.packages = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = with pkgs; [
        noto-fonts-color-emoji
        jetbrains-mono
        nerd-fonts.jetbrains-mono
        nerd-fonts.symbols-only
        font-awesome
      ];
      description = "Desktop font packages";
    };
  };

  config = lib.mkIf requested {
    gtk = {
      enable = true;
      gtk4.theme = config.gtk.theme;
      theme = {
        name = gtkTheme.name;
        package = gtkTheme.package;
      };
      iconTheme = {
        name = gtkIcons.name;
        package = gtkIcons.package;
      };
    };

    dconf.settings = {
      "org/gnome/desktop/interface" = {
        icon-theme = gtkIcons.name;
        color-scheme = "prefer-dark";
      };
    };

    home.packages = gtkPackages ++ fonts.packages;
  };
}
