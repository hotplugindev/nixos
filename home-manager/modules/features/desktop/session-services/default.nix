{ ... }:
{
  imports = [
    ./packages.nix
    ./dbus-env.nix
    ./waybar.nix
    ./nextcloud.nix
    ./swaybg.nix
    ./nm-applet.nix
    ./cliphist-text.nix
    ./cliphist-image.nix
    ./swaync.nix
  ];
}
