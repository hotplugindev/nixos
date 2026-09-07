{
  lib,
  config,
  pkgs,
  ...
}:
let
  perl = config.gb.home.dev.languages.perl;
in
{
  options = {
    gb.home.dev.languages.perl.enable = lib.mkEnableOption "Enable Perl language tools";
  };

  config = lib.mkIf perl.enable {
    home.packages = [
      pkgs.perl
    ];
  };
}
