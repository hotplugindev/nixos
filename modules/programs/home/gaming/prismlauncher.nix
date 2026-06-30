{
  lib,
  config,
  pkgs,
  ...
}:
let
  prismlauncher = config.gb.home.programs.gaming.prismlauncher;
in
{
  options = {
    gb.home.programs.gaming.prismlauncher.enable =
      lib.mkEnableOption "Enables some essentials for steam like protonup or mangohud";
  };

  config = lib.mkIf prismlauncher.enable {
    home.packages = [
      pkgs.prismlauncher
    ];
  };
}
