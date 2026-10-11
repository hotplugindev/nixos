{
  lib,
  config,
  ...
}:
let
  dms = config.gb.home.desktopshells.dms;
  mangoWallpaper = lib.attrByPath [ "gb" "home" "desktop" "mango" "core" "wallpaper" "default" ] null config;
  sourceBase = builtins.baseNameOf (toString dms.wallpaper.source);
  ext =
    if builtins.match ".*\\..+" sourceBase != null then
      lib.last (lib.strings.splitString "." sourceBase)
    else
      "png";
  wallpaperPath = "${config.home.homeDirectory}/.config/DankMaterialShell/wallpapers/default.${ext}";
in
{
  options.gb.home.desktopshells.dms.wallpaper = {
    enable = lib.mkEnableOption "Enable declarative DMS wallpaper defaults";

    source = lib.mkOption {
      type = with lib.types; nullOr path;
      default = mangoWallpaper;
      description = "Source image linked to `~/.config/DankMaterialShell/wallpapers/default`.";
    };

    fillMode = lib.mkOption {
      type = lib.types.str;
      default = "Fill";
      description = "DMS wallpaper fill mode (`settings.wallpaperFillMode`).";
    };

    transition = lib.mkOption {
      type = lib.types.str;
      default = "fade";
      description = "DMS wallpaper transition (`session.wallpaperTransition`).";
    };
  };

  config = lib.mkMerge [
    {
      gb.home.desktopshells.dms.wallpaper.enable = lib.mkDefault true;
    }
    (lib.mkIf (dms.enable && dms.wallpaper.enable) {
      gb.home.desktopshells.dms.program.settings.wallpaperFillMode = lib.mkDefault dms.wallpaper.fillMode;
      gb.home.desktopshells.dms.program.session.wallpaperPath = lib.mkDefault wallpaperPath;
      gb.home.desktopshells.dms.program.session.wallpaperTransition =
        lib.mkDefault dms.wallpaper.transition;

      xdg.configFile."DankMaterialShell/wallpapers/default.${ext}" = lib.mkIf (dms.wallpaper.source != null) {
        source = dms.wallpaper.source;
      };
    })
  ];
}
