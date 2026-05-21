{
  lib,
  config,
  pkgs,
  ...
}:
let
  google-chrome = config.gb.home.programs.web.google-chrome;
in
{
  options = {
    gb.home.programs.web.google-chrome.enable = lib.mkEnableOption "Enable google-chrome web browser";
  };

  config = lib.mkIf google-chrome.enable {
    home.packages = [
      pkgs.google-chrome
    ];
  };
}
