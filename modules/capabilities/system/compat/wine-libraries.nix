{
  lib,
  config,
  pkgs,
  ...
}:
let
  requested = config.gb.requires.system.compat.wineLibraries != [ ];
in
{
  config = lib.mkIf requested {
    environment.systemPackages = with pkgs; [
      gnutls
      krb5
      samba
    ];
  };
}
