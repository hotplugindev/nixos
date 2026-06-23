{
  lib,
  config,
  pkgs,
  ...
}:
let
  wine = config.gb.programs.system.wine;
in
{
  options.gb.programs.system.wine.enable = lib.mkEnableOption "Install Wine";

  config = lib.mkIf wine.enable {
    environment.systemPackages = [
      pkgs.wineWow64Packages.stagingFull
      pkgs.winetricks
    ];

    gb.requires.system.compat.wineLibraries = [ "programs.system.wine" ];
    gb.requires.system.fonts.windows = [ "programs.system.wine" ];
    gb.requires.system.locale.glibc = [ "programs.system.wine" ];
  };
}
