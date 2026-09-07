{
  lib,
  config,
  pkgs,
  ...
}:
let
  r = config.gb.home.dev.languages.r;
in
{
  options = {
    gb.home.dev.languages.r.enable = lib.mkEnableOption "Enable R development tools";
  };

  config = lib.mkIf r.enable {
    home.packages = [
      pkgs.R
    ];
  };
}
