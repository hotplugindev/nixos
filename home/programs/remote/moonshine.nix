{
  lib,
  config,
  pkgs,
  ...
}:
let
  moonshine = config.gb.home.programs.remote.moonshine;
in
{
  options = {
    gb.home.programs.remote.moonshine.enable =
      lib.mkEnableOption "Enable remmina remote desktop connections";
  };

  config = lib.mkIf moonshine.enable {
    home.packages = [
      pkgs.moonshine
    ];
  };
}
