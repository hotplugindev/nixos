{ pkgs, ... }:

{
  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  home.packages = with pkgs; [
    papirus-icon-theme
    adwaita-icon-theme
  ];
}