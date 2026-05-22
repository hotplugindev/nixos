{ lib, config, ... }:
let
  optimizations = config.gb.nix.optimizations;
in
{
  options.gb.nix.optimizations = {
    enable = lib.mkEnableOption "Enable optimizations";
    auto-optimize = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable automatic optimization";
    };
    auto-optimise-store = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable store auto-optimization";
    };
  };

  config = lib.mkIf optimizations.enable {
    nix.settings.auto-optimise-store = lib.mkIf optimizations.auto-optimise-store true;
    nix.optimise.automatic = lib.mkIf optimizations.auto-optimize true;
  };
}
