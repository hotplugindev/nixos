{
  lib,
  config,
  pkgs-unstable,
  ...
}:
let
  antigravity-cli = config.gb.home.programs.ai.antigravity-cli;
in
{
  options = {
    gb.home.programs.ai.antigravity-cli.enable = lib.mkEnableOption "Enable gemini-cli";
  };

  config = lib.mkIf antigravity-cli.enable {
    home.packages = [
      pkgs-unstable.antigravity-cli
    ];
  };
}
