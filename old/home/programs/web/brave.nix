{
  lib,
  config,
  pkgs,
  ...
}:
let
  brave = config.gb.home.programs.web.brave;
in
{
  options = {
    gb.home.programs.web.brave.enable = lib.mkEnableOption "Enable brave web browser";
  };

  config = lib.mkIf brave.enable {
    home.packages = [
      pkgs.brave
    ];
  };
}
