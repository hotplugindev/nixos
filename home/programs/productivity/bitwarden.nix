{
  lib,
  config,
  pkgs,
  ...
}:
let
  bitwarden = config.gb.home.programs.productivity.bitwarden;
in
{
  options = {
    gb.home.programs.productivity.bitwarden.enable = lib.mkEnableOption "Enables the bitwarden client";
  };

  config = lib.mkIf bitwarden.enable {
    home.packages = [
      pkgs.bitwarden-desktop
      pkgs.totp-cli
    ];
  };
}
