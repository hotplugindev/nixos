{ lib, config, pkgs, ... }:
let
  requested = config.gb.requires.system.fonts.windows != [ ];
  packages = config.gb.system.fonts.windows.packages;
in
{
  options.gb.system.fonts.windows.packages = lib.mkOption {
    type = lib.types.listOf lib.types.package;
    default = with pkgs; [
      corefonts
    ];
    description = "Windows-compatible fonts";
  };

  config = lib.mkIf requested {
    fonts.packages = packages;
  };
}
