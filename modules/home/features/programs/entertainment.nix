{ pkgs, ... }:
{
  home.packages = with pkgs; [
    mangohud
    gamescope
    protonup-qt
  ];
}
