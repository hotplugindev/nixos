{
  lib,
  config,
  pkgs,
  ...
}:
let
  gnupg = config.gb.system.security.gnupg;
in
{
  options = {
    gb.system.security.gnupg.enable = lib.mkEnableOption "Enable rtkit";
  };

  config = lib.mkIf gnupg.enable {
    programs.gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-tty;
    };
  };
}
