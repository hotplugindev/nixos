{
  lib,
  config,
  pkgs,
  ...
}:
let
  tt = config.gb.home.programs.gaming.tt;
in
{
  options = {
    gb.home.programs.gaming.tt.enable =
      lib.mkEnableOption "Enables tt Terminal Typer (type tester in the terminal)";
  };

  config = lib.mkIf tt.enable {
    home.packages = [
      pkgs.tt
    ];
  };
}
