{ ... }:
{
  programs.nixvim = {
    colorschemes.gruvbox.enable = true;

    plugins = {
      web-devicons.enable = true;

      lualine = {
        enable = true;
        settings.options = {
          theme = "gruvbox";
          globalstatus = true;
        };
      };

      bufferline.enable = true;

      nvim-tree = {
        enable = true;
        openOnSetup = false;
        hijackCursor = true;
        updateFocusedFile.enable = true;
        view.width = 32;
      };

      which-key = {
        enable = true;
        settings = {
          preset = "modern";
        };
      };

      notify.enable = true;
      noice.enable = true;
      dressing.enable = true;

      indent-blankline.enable = true;

      treesitter-context.enable = true;
    };
  };
}
