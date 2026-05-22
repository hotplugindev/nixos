{
  lib,
  config,
  pkgs,
  ...
}:
let
  gemini-cli = config.gb.home.programs.ai.gemini-cli;
in
{
  options = {
    gb.home.programs.ai.gemini-cli.enable = lib.mkEnableOption "Enable gemini-cli";
  };

  config = lib.mkIf gemini-cli.enable {
    home.packages = [
      pkgs.gemini-cli
    ];
  };
}
