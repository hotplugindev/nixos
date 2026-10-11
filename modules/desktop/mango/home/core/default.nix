{ lib, ... }:
{
  options.gb.home.desktop.mango.core = {
    enable = lib.mkEnableOption "Enable Mango core options";

    wallpaper.default = lib.mkOption {
      type = lib.types.path;
      default = ../../../assets/kitty.png;
      description = "Default wallpaper source for desktop shells.";
    };

    wallpaper.directory = lib.mkOption {
      type = lib.types.path;
      default = ../../../assets;
      description = "Shared wallpaper directory browsed by desktop shells.";
    };
  };

  config.gb.home.desktop.mango.core.enable = lib.mkDefault true;
}
