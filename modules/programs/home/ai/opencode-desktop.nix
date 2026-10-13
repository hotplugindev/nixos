{
  lib,
  config,
  pkgs-unstable,
  ...
}:
let
  opencode-desktop = config.gb.home.programs.ai.opencode-desktop;
in
{
  options = {
    gb.home.programs.ai.opencode-desktop.enable = lib.mkEnableOption "Enable opencode desktop agent";
  };

  config = lib.mkIf opencode-desktop.enable {
    home.packages = [
      pkgs-unstable.opencode-desktop
    ];
  };
}
