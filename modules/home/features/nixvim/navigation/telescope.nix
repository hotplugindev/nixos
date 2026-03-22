{ ... }:
{
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
}