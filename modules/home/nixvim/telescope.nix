{ ... }:
{
  programs.nixvim.plugins.telescope = {
    enable = true;
    settings.defaults = {
      layout_strategy = "horizontal";
      sorting_strategy = "ascending";
      prompt_prefix = "   ";
      selection_caret = "  ";
      path_display = [ "smart" ];
    };
  };
}
