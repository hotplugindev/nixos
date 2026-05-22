{
  lib,
  config,
  pkgs,
  ...
}:
let
  remmina = config.gb.home.programs.remote.remmina;
in
{
  options = {
    gb.home.programs.remote.remmina.enable =
      lib.mkEnableOption "Enable remmina remote desktop connections";
  };

  config = lib.mkIf remmina.enable {
    home.packages = [
      pkgs.remmina
    ];
  };
}
