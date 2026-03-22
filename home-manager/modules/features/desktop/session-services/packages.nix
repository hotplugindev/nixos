{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nextcloud-client
    waybar
    swaybg
    wl-clipboard
    cliphist
    networkmanagerapplet
  ];
}
