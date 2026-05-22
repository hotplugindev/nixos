{
  lib,
  config,
  pkgs,
  ...
}:
let
  onlyoffice = config.gb.home.programs.productivity.onlyoffice;
in
{
  options = {
    gb.home.programs.productivity.onlyoffice.enable = lib.mkEnableOption "Enable the onlyoffice suite";
  };

  config = lib.mkIf onlyoffice.enable {
    home.packages = [
      pkgs.onlyoffice-desktopeditors
    ];
  };
}
