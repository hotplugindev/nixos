{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gimp2
    onlyoffice-desktopeditors
    obsidian
    spotify
  ];
}
