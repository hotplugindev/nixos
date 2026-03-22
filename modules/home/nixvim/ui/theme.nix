{ ... }:
{
  programs.nixvim = {
    colorschemes.gruvbox = {
      enable = true;
      settings = {
        contrast = "hard";
        transparent_mode = false;
      };
    };

    plugins = {
      web-devicons.enable = true;
      indent-blankline.enable = true;
      which-key = {
        enable = true;
        settings = {
          preset = "modern";
          delay = 300;
          icons.group = "+";
          spec = [
            { __unkeyed-1 = "<leader>f"; group = "find"; }
            { __unkeyed-1 = "<leader>g"; group = "git"; }
            { __unkeyed-1 = "<leader>l"; group = "lsp"; }
            { __unkeyed-1 = "<leader>b"; group = "buffers"; }
            { __unkeyed-1 = "<leader>t"; group = "toggle/terminal"; }
            { __unkeyed-1 = "<leader>c"; group = "code"; }
            { __unkeyed-1 = "<leader>w"; group = "windows"; }
          ];
        };
      };
    };
  };
}