{
  lib,
  config,
  ...
}:
let
  leetcode = config.gb.home.dev.nixvim.tools.leetcode;
in
{
  options = {
    gb.home.dev.nixvim.tools.leetcode.enable = lib.mkEnableOption "Enable nixvim leetcode";
  };

  config = lib.mkIf leetcode.enable {
    programs.nixvim.plugins.leetcode = {
      enable = true;
    };
  };
}
