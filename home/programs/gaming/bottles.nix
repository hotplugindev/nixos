{
  lib,
  config,
  pkgs,
  ...
}:
let
  bottles = config.gb.home.programs.gaming.bottles;
in
{
  options = {
    gb.home.programs.gaming.bottles.enable = lib.mkEnableOption "Enables Bottles windows emulator";
  };

  config = lib.mkIf bottles.enable {
    home.packages = [
      pkgs.bottles
    ];
  };
}
