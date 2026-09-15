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
      lib.mkEnableOption "Enable TigerVNC remote desktop client";
  };

  config = lib.mkIf tigervnc.enable {
    home.packages = [
      pkgs.tigervnc
    ];
  };
}
