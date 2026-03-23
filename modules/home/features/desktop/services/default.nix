{ pkgs, ... }:
{
  imports = [
    ./dbus-env.nix
    ./waybar.nix
    ./nextcloud.nix
    ./swaybg.nix
    ./nm-applet.nix
    ./cliphist-text.nix
    ./cliphist-image.nix
    ./swaync.nix
  ];

  home.packages = with pkgs; [
    nextcloud-client
    waybar
    swaybg
    wl-clipboard
    cliphist
    networkmanagerapplet
  ];
}
