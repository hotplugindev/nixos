{
  lib,
  config,
  pkgs,
  ...
}:
let
  requested = config.gb.requires.system.locale.glibc != [ ];
in
{
  config = lib.mkIf requested {
    environment.systemPackages = [ pkgs.glibcLocales ];
  };
}
