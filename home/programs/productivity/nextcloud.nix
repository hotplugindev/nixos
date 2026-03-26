{
  lib,
  config,
  pkgs,
  ...
}:
let
  nextcloud = config.gb.home.programs.productivity.nextcloud;
in
{
  options = {
    gb.home.programs.productivity.nextcloud.enable = lib.mkEnableOption "Enables the nextcloud client";
  };

  config = lib.mkIf nextcloud.enable {
    home.packages = [
      pkgs.nextcloud-client
    ];
  };
}
