{
  lib,
  config,
  pkgs,
  ...
}:
let
  tigervnc = config.gb.home.programs.remote.tigervnc;
in
{
  options = {
    gb.home.programs.remote.tigervnc.enable =
      lib.mkEnableOption "Enable remmina remote desktop connections";
  };

  config = lib.mkIf tigervnc.enable {
    home.packages = [
      pkgs.tigervnc
    ];
  };
}
