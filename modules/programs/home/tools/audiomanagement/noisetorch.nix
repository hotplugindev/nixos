{
  lib,
  config,
  pkgs,
  ...
}:
let
  noisetorch = config.gb.home.tools.audiomanagement.noisetorch;
in
{
  options = {
    gb.home.tools.audiomanagement.noisetorch.enable = lib.mkEnableOption "Enable brave web browser";
  };

  config = lib.mkIf noisetorch.enable {
    home.packages = [
      pkgs.noisetorch
    ];
  };
}
