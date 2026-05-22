{
  lib,
  config,
  pkgs,
  ...
}:
let
  claude-code = config.gb.home.programs.ai.claude-code;
in
{
  options = {
    gb.home.programs.ai.claude-code.enable = lib.mkEnableOption "Enable claude-code agent";
  };

  config = lib.mkIf claude-code.enable {
    home.packages = [
      pkgs.claude-code
    ];
  };
}
