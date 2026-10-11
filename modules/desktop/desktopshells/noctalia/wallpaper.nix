{
  lib,
  config,
  ...
}:
let
  noctalia = config.gb.home.desktopshells.noctalia;
  mangoWallpaper = lib.attrByPath [ "gb" "home" "desktop" "mango" "core" "wallpaper" "default" ] null config;
  sharedAssets = lib.attrByPath [ "gb" "home" "desktop" "mango" "core" "wallpaper" "directory" ] null config;
  sourceBase = builtins.baseNameOf (toString noctalia.wallpaper.source);
  ext =
    if builtins.match ".*\\..+" sourceBase != null then
      lib.last (lib.strings.splitString "." sourceBase)
    else
      "png";
  wallpaperDir = "${config.home.homeDirectory}/.config/noctalia/wallpapers";
  wallpaperFile = "${wallpaperDir}/default.${ext}";
  browseDir = if sharedAssets != null then toString sharedAssets else wallpaperDir;
in
{
  options.gb.home.desktopshells.noctalia.wallpaper = {
    enable = lib.mkEnableOption "Enable declarative Noctalia wallpaper defaults";

    source = lib.mkOption {
      type = with lib.types;
      nullOr path;
      default = mangoWallpaper;
      description = "Source image linked to `~/.config/noctalia/wallpapers/default.<ext>` and applied as the active wallpaper via `wallpaper.default.path`.";
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

  options.gb.home.desktopshells.noctalia.config.wallpaper.default.path = lib.mkOption {
    type = with lib.types;
    nullOr str;
    default = null;
    description = "Absolute path of the wallpaper applied to every output at startup.";
  };

  config = lib.mkMerge [
    {
      gb.home.desktopshells.noctalia.wallpaper.enable = lib.mkDefault true;
    }
    (lib.mkIf (noctalia.enable && noctalia.wallpaper.enable) {
      gb.home.desktopshells.noctalia.config.wallpaper = {
        directory = lib.mkDefault browseDir;
        fill_mode = lib.mkDefault noctalia.wallpaper.fillMode;
        transition = lib.mkDefault noctalia.wallpaper.transition;
        transition_duration = lib.mkDefault noctalia.wallpaper.transitionDuration;
        default.path = lib.mkIf (noctalia.wallpaper.source != null) (lib.mkDefault wallpaperFile);
      };

      xdg.configFile."noctalia/wallpapers/default.${ext}" = lib.mkIf (noctalia.wallpaper.source != null) {
        source = noctalia.wallpaper.source;
      };
    })
  ];
}
