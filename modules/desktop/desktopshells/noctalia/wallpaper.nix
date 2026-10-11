{
  lib,
  config,
  ...
}:
let
  noctalia = config.gb.home.desktopshells.noctalia;
  mangoWallpaper = lib.attrByPath [ "gb" "home" "desktop" "mango" "core" "wallpaper" "default" ] null config;
  sourceBase = builtins.baseNameOf (toString noctalia.wallpaper.source);
  ext =
    if builtins.match ".*\\..+" sourceBase != null then
      lib.last (lib.strings.splitString "." sourceBase)
    else
      "png";
  wallpaperDir = "${config.home.homeDirectory}/.config/noctalia/wallpapers";
in
{
  options.gb.home.desktopshells.noctalia.wallpaper = {
    enable = lib.mkEnableOption "Enable declarative Noctalia wallpaper defaults";

    source = lib.mkOption {
      type = with lib.types; nullOr path;
      default = mangoWallpaper;
      description = "Source image linked into the Noctalia wallpaper directory.";
    };

    fillMode = lib.mkOption {
      type = lib.types.enum [ "center" "crop" "fit" "stretch" "repeat" "span" ];
      default = "crop";
      description = "Wallpaper fill mode.";
    };

    transition = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ "fade" "wipe" "disc" "stripes" "zoom" "honeycomb" ];
      description = "Wallpaper transition effects (cycled in order).";
    };

    transitionDuration = lib.mkOption {
      type = lib.types.number;
      default = 1500.0;
      description = "Wallpaper transition duration in milliseconds.";
    };
  };

  config = lib.mkMerge [
    {
      gb.home.desktopshells.noctalia.wallpaper.enable = lib.mkDefault true;
    }
    (lib.mkIf (noctalia.enable && noctalia.wallpaper.enable) {
      gb.home.desktopshells.noctalia.config.wallpaper = {
        directory = lib.mkDefault wallpaperDir;
        fill_mode = lib.mkDefault noctalia.wallpaper.fillMode;
        transition = lib.mkDefault noctalia.wallpaper.transition;
        transition_duration = lib.mkDefault noctalia.wallpaper.transitionDuration;
      };

      xdg.configFile."noctalia/wallpapers/default.${ext}" = lib.mkIf (noctalia.wallpaper.source != null) {
        source = noctalia.wallpaper.source;
      };
    })
  ];
}
