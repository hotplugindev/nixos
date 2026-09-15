{
  lib,
  config,
  pkgs,
  ...
}:
let
  element = config.gb.home.programs.communication.element;
in
{
  options = {
    gb.home.programs.communication.element.enable = lib.mkEnableOption "Enable Element";
  };

  config = lib.mkIf element.enable {
    home.packages = [
      pkgs.element-desktop
    ];
  };
}
