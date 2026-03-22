{ ... }:
{
  programs.nixvim = {
    colorschemes.gruvbox.enable = true;
    
    plugins = {
      web-devicons.enable = true;
      
      # Dashboard (NvChad style)
      alpha = {
        enable = true;
        theme = "dashboard";
      };

      lualine = {
        enable = true;
        settings.options = {
          theme = "gruvbox";
          globalstatus = true;
          component_separators = { left = "|"; right = "|"; };
          section_separators = { left = " "; right = " "; };
        };
      };

      bufferline = {
        enable = true;
        settings.options.offsets = [
          {
            filetype = "NvimTree";
            text = "File Explorer";
            highlight = "Directory";
            text_align = "left";
          }
        ];
      };

      nvim-tree = {
        enable = true;
        settings.view.width = 30;
      };

      which-key = {
        enable = true;
        settings.preset = "modern";
      };

      indent-blankline.enable = true;
      noice.enable = true;
      notify.enable = true;
      dressing.enable = true;
    };
  };
}