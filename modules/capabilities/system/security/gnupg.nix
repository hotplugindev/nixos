{ lib, config, pkgs, ... }:
let
  requested = config.gb.requires.system.security.gnupg != [ ];
in
{
  config = lib.mkIf requested {
    programs.gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-tty;
    };
  };
}
