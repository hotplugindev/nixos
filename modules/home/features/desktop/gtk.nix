{ pkgs, ... }:

{
  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      icon-theme = "Papirus-Dark";
    };
  };

  home.packages = with pkgs; [
    papirus-icon-theme
    adwaita-icon-theme
    hicolor-icon-theme
  ];
}