{
  lib,
  config,
  ...
}:
let
  mango = config.gb.home.desktop.mango;
  dms = mango.dms;
  wallpaperPath = "${config.home.homeDirectory}/.config/DankMaterialShell/wallpapers/default";
in
{
  options.gb.home.desktop.mango.dms.wallpaper = {
    enable = lib.mkEnableOption "Enable declarative DMS wallpaper defaults";

    source = lib.mkOption {
      type = with lib.types; nullOr path;
      default = config.gb.home.desktop.mango.core.wallpaper.default;
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
      gb.home.desktop.mango.dms.wallpaper.enable = lib.mkDefault true;
    }
    (lib.mkIf (mango.enable && dms.enable && dms.wallpaper.enable) {
      gb.home.desktop.mango.dms.program.settings.wallpaperFillMode = lib.mkDefault dms.wallpaper.fillMode;
      gb.home.desktop.mango.dms.program.session.wallpaperPath = lib.mkDefault wallpaperPath;
      gb.home.desktop.mango.dms.program.session.wallpaperTransition = lib.mkDefault dms.wallpaper.transition;

      xdg.configFile."DankMaterialShell/wallpapers/default" = lib.mkIf (dms.wallpaper.source != null) {
        source = dms.wallpaper.source;
      };
    })
  ];
}
