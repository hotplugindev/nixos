{
  lib,
  config,
  ...
}:
let
  telescope = config.gb.home.dev.nixvim.navigation.telescope;
in
{
  options = {
    gb.home.dev.nixvim.navigation.telescope.enable = lib.mkEnableOption "Enable nixvim telescope";
  };

  config = lib.mkIf telescope.enable {
    programs.nixvim.plugins.telescope = {
      enable = true;
      extensions = {
        fzf-native.enable = true;
        ui-select.enable = true;
      };
      settings = {
        defaults = {
          layout_strategy = "horizontal";
          sorting_strategy = "ascending";
          prompt_prefix = "   ";
          selection_caret = "  ";
          path_display = [ "smart" ];
          file_ignore_patterns = [
            "node_modules"
            ".git/"
            "dist"
            "result"
          ];
        };
        pickers = {
          find_files.hidden = true;
          buffers.sort_mru = true;
          live_grep.additional_args = ''function() return { "--hidden" } end'';
        };
      };
    };
  };
}