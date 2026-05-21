{ lib, config, ... }:
let
  flakes = config.gb.nix.flakes;
in
{
  options = {
    gb.nix.flakes.enable = lib.mkEnableOption "Enable flakes for the system";
  };

  config = lib.mkIf flakes.enable {
    nix.settings.experimental-features = [
      "flakes"
    ];
  };
}
