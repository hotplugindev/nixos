{ ... }:
{
  programs.nixvim.plugins = {
    comment.enable = true;
    nvim-autopairs.enable = true;
    vim-surround.enable = true;

    gitsigns.enable = true;

    todo-comments.enable = true;
  };
}
