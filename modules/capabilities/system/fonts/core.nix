{
  lib,
  config,
  pkgs,
  ...
}:
let
  requested = config.gb.requires.system.fonts.core != [ ];
  packages = config.gb.system.fonts.core.packages;
in
{
  options.gb.system.fonts.core.packages = lib.mkOption {
    type = lib.types.listOf lib.types.package;
    default = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      liberation_ttf
      dejavu_fonts
    ];
    description = "Core system fonts";
  };

  config = lib.mkIf requested {
    fonts.packages = packages;
  };
}
