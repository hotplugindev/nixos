{
  lib,
  config,
  pkgs-unstable,
  ...
}:
let
  codex = config.gb.home.programs.ai.codex;
in
{
  options = {
    gb.home.programs.ai.codex.enable = lib.mkEnableOption "Enable codex openai";
  };

  config = lib.mkIf codex.enable {
    home.packages = [
      pkgs-unstable.codex
    ];
  };
}
