{ ... }:
{
  programs.nixvim.plugins = {
    comment.enable = true;
    nvim-autopairs.enable = true;
    surround.enable = true;

    gitsigns.enable = true;

    todo-comments.enable = true;
  };
}
