{
  lib,
  config,
  pkgs,
  ...
}:
let
  mango = config.gb.home.desktop.mango;
  cfg = mango.mangowc;
in
{
  config = lib.mkIf (mango.enable && mango.mangowc.enable && cfg.packages.enable) {
    gb.home.desktop.mango.mangowc.packages.base = lib.mkDefault (
      with pkgs;
      [
        foot
        brightnessctl
        pamixer
        playerctl
        nautilus
        evince
        loupe
        file-roller
        networkmanagerapplet
        swaylock
        qt6Packages.qt6ct
        polkit_gnome
        wl-clipboard
        wlr-randr
      ]
    );

    home.packages =
      cfg.packages.base ++ lib.optionals (config.gb.host.class == "laptop") cfg.packages.laptopExtra;
  };
}
