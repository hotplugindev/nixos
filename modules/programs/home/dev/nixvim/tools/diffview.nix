{
  lib,
  config,
  ...
}:
let
  diffview = config.gb.home.dev.nixvim.tools.diffview;
in
{
  options = {
    gb.home.dev.nixvim.tools.diffview.enable =
      lib.mkEnableOption "Enable nixvim diffview for code history and merges";
  };

  config = lib.mkIf diffview.enable {
    programs.nixvim.plugins.diffview.enable = true;
  };
}
