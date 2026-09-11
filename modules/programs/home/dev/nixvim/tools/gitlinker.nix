{
  lib,
  config,
  ...
}:
let
  gitlinker = config.gb.home.dev.nixvim.tools.gitlinker;
in
{
  options = {
    gb.home.dev.nixvim.tools.gitlinker.enable =
      lib.mkEnableOption "Enable nixvim gitlinker for shareable git permalinks";
  };

  config = lib.mkIf gitlinker.enable {
    programs.nixvim.plugins.gitlinker = {
      enable = true;
    };
  };
}
