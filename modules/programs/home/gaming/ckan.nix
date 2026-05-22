{
  lib,
  config,
  pkgs,
  username,
  ...
}:
let
  ckan = config.gb.home.programs.gaming.ckan;
in
{
  options = {
    gb.home.programs.gaming.ckan.enable = lib.mkEnableOption "Enables kerbal space mod manager";
  };

  config = lib.mkIf ckan.enable {
    home.packages = [
      pkgs.ckan
    ];
  };
}
