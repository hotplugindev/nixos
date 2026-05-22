{
  lib,
  config,
  pkgs,
  ...
}:
let
  librewolf = config.gb.home.programs.web.librewolf;
in
{
  options = {
    gb.home.programs.web.librewolf.enable = lib.mkEnableOption "Enable librewolf web browser";
  };

  config = lib.mkIf librewolf.enable {
    home.packages = [
      pkgs.librewolf
    ];
  };
}
