{
  lib,
  config,
  pkgs,
  ...
}:
let
  fonts = config.gb.system.locales.fonts;
in
{
  options = {
    gb.system.locales.fonts = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [
        pkgs.noto-fonts
      ];
      description = "Fonts to be installed on the system";
    };
  };

  config = {
    environment.systemPackages = fonts;
  };
}
