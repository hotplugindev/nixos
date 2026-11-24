{
  lib,
  config,
  pkgs,
  ...
}:
let
  umbriel = config.gb.home.desktop.umbriel;
  cfg = umbriel.umbriel;
in
{
  config = lib.mkIf (umbriel.enable && umbriel.umbriel.enable && cfg.packages.enable) {
    gb.home.desktop.umbriel.umbriel.packages.base = lib.mkDefault (
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
        grim
        slurp
        wl-clipboard
        wlr-randr
      ]
    );

    home.packages =
      cfg.packages.base ++ lib.optionals (config.gb.host.class == "laptop") cfg.packages.laptopExtra;
  };
}
