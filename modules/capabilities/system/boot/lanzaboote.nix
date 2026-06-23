{
  lib,
  config,
  pkgs,
  ...
}:
let
  requested = config.gb.requires.system.boot.lanzaboote != [ ];
in
{
  config = lib.mkIf requested {
    boot.lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
      autoGenerateKeys.enable = true;
    };

    boot.loader.systemd-boot.enable = lib.mkForce false;
    environment.systemPackages = [ pkgs.sbctl ];
  };
}
