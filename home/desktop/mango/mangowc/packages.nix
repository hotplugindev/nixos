{
  lib,
  config,
  pkgs,
  hostType,
  ...
}:
let
  mango = config.gb.home.desktop.mango;
  cfg = mango.mangowc;
in
{
  config = lib.mkIf (mango.enable && mango.mangowc.enable && cfg.packages.enable) {
    gb.home.desktop.mango.mangowc.packages.base = lib.mkDefault (with pkgs; [
      foot
      wofi
      grim
      slurp
      brightnessctl
      pamixer
      playerctl
      nautilus
      swaylock
      qt6Packages.qt6ct
      polkit_gnome
      wl-clipboard
      cliphist
      wlr-randr
    ]);

    home.packages = cfg.packages.base ++ lib.optionals (hostType == "laptop") cfg.packages.laptopExtra;
  };
}
