{ lib, ... }:
{
  options.gb.home.desktop.mango.core = {
    enable = lib.mkEnableOption "Enable Mango core options";

    wallpaper.default = lib.mkOption {
      type = lib.types.path;
      default = ../assets/kitty.png;
      description = "Default wallpaper used for DMS wallpaper provisioning.";
    };
  };

  config.gb.home.desktop.mango.core.enable = lib.mkDefault true;
}
