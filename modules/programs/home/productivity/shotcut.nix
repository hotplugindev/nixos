{
  lib,
  config,
  pkgs,
  ...
}:
let
  shotcut = config.gb.home.programs.productivity.shotcut;
in
{
  options = {
    gb.home.programs.productivity.shotcut.enable =
      lib.mkEnableOption "Enable Shotcut video editor";
  };

  config = lib.mkIf shotcut.enable {
    home.packages = [
      pkgs.shotcut
    ];
  };
}
