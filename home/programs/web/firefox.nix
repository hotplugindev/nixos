{
  lib,
  config,
  pkgs,
  ...
}:
let
  firefox = config.gb.home.programs.web.firefox;
in
{
  options = {
    gb.home.programs.web.firefox.enable = lib.mkEnableOption "Enable firefox web browser";
  };

  config = lib.mkIf firefox.enable {
    home.packages = [
      pkgs.firefox
    ];
  };
}
