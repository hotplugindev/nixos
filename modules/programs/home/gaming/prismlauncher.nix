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
      lib.mkEnableOption "Enables Prism Launcher for Minecraft";
  };

  config = lib.mkIf prismlauncher.enable {
    home.packages = [
      pkgs.prismlauncher
    ];
  };
}
