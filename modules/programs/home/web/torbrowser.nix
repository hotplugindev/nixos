{
  lib,
  config,
  pkgs,
  ...
}:
let
  torbrowser = config.gb.home.programs.web.torbrowser;
in
{
  options = {
    gb.home.programs.web.torbrowser.enable = lib.mkEnableOption "Enable TOR web browser";
  };

  config = lib.mkIf torbrowser.enable {
    home.packages = [
      pkgs.tor-browser
    ];
  };
}
