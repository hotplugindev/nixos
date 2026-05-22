{
  lib,
  config,
  pkgs,
  ...
}:
let
  moonlight-qt = config.gb.home.programs.remote.moonlight-qt;
in
{
  options = {
    gb.home.programs.remote.moonlight-qt.enable = lib.mkEnableOption "Sunshine remote dekstop client";
  };

  config = lib.mkIf moonlight-qt.enable {
    home.packages = [
      pkgs.moonlight-qt
    ];
  };
}
