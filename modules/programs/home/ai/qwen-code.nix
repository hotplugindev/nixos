{
  lib,
  config,
  pkgs,
  ...
}:
let
  qwen-code = config.gb.home.programs.ai.qwen-code;
in
{
  options = {
    gb.home.programs.ai.qwen-code.enable = lib.mkEnableOption "Enable qwen-code";
  };

  config = lib.mkIf qwen-code.enable {
    home.packages = [
      pkgs.qwen-code
    ];
  };
}
