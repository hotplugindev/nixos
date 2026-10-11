{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
let
  cfg = config.gb.home.programs.entertainment.riff;
in
{
  options = {
    gb.home.programs.entertainment.riff = {
      enable = lib.mkEnableOption "Riff audio player";

      package = lib.mkOption {
        type = lib.types.package;
        default = inputs.riff.packages.${pkgs.stdenv.hostPlatform.system}.default;
        description = "Riff package to install.";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ cfg.package ];
  };
}
