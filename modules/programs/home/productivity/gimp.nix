{
  lib,
  config,
  pkgs,
  ...
}:
let
  gimp = config.gb.home.programs.productivity.gimp;
in
{
  options = {
    gb.home.programs.productivity.gimp.enable =
      lib.mkEnableOption "Enables the gnu image manipulation prgram";
  };

  config = lib.mkIf gimp.enable {
    home.packages = [
      pkgs.gimp2
    ];
  };
}
