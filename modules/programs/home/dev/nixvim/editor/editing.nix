{
  lib,
  config,
  ...
}:
let
  editing = config.gb.home.dev.nixvim.editor.editing;
in
{
  options = {
    gb.home.dev.nixvim.editor.editing.enable = lib.mkEnableOption "Enable nixvim editing enhancements";
  };

  config = lib.mkIf editing.enable {
    programs.nixvim.plugins = {
      comment.enable = true;
      nvim-autopairs.enable = true;
      vim-surround.enable = true;
      todo-comments.enable = true;

      illuminate.enable = true;

      rainbow-delimiters.enable = true;
    };
  };
}