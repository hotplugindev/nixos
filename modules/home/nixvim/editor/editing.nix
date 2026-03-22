{ ... }:
{
  programs.nixvim.plugins = {
    comment.enable = true;
    nvim-autopairs.enable = true;
    vim-surround.enable = true;
    todo-comments.enable = true;

    illuminate.enable = true;

    rainbow-delimiters.enable = true;
  };
}