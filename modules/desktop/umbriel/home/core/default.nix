{ lib, ... }:
{
  options.gb.home.desktop.umbriel.core = {
    enable = lib.mkEnableOption "Enable Umbriel core options";

    wallpaper.default = lib.mkOption {
      type = lib.types.path;
      default = ../../../assets/gruv-dark.png;
      description = "Default wallpaper source for desktop shells.";
    };

    wallpaper.directory = lib.mkOption {
      type = lib.types.path;
      default = ../../../assets;
      description = "Shared wallpaper directory browsed by desktop shells.";
    };
  };

  config.gb.home.desktop.umbriel.core.enable = lib.mkDefault true;
}
