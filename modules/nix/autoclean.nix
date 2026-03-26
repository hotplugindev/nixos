{ lib, config, ... }:
let
  autoclean = config.gb.nix.autoclean;
in
{
  options = {
    gb.nix.autoclean.enable = lib.mkEnableOption "Setup autoclean for the system";
  };

  config = lib.mkIf autoclean.enable {
    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}
