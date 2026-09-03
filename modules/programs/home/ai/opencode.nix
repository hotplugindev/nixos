{
  lib,
  config,
  pkgs,
  ...
}:
let
  opencode = config.gb.home.programs.ai.opencode;
in
{
  options = {
    gb.home.programs.ai.opencode.enable = lib.mkEnableOption "Enable opencode agent";
  };

  config = lib.mkIf opencode.enable {
    home.packages = [
      pkgs.opencode
    ];
  };
}
