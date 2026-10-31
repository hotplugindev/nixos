{
  lib,
  config,
  pkgs,
  ...
}:
let
  vesktop = config.gb.home.programs.communication.vesktop;
in
{
  options = {
    gb.home.programs.communication.vesktop.enable = lib.mkEnableOption "Enable vesktop";
  };

  config = lib.mkIf vesktop.enable {
    home.packages = [
      pkgs.vesktop
    ];
  };
}
