{
  lib,
  config,
  pkgs-unstable,
  ...
}:
let
  llama-cpp = config.gb.home.programs.ai.llama-cpp;
in
{
  options = {
    gb.home.programs.ai.llama-cpp.enable = lib.mkEnableOption "Enable codex openai";
  };

  config = lib.mkIf llama-cpp.enable {
    home.packages = [
      pkgs-unstable.llama-cpp
    ];
  };
}
