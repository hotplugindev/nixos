{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;

    # basic settings
    opts = {
      number = true;
      relativenumber = true;
      tabstop = 4;
      shiftwidth = 4;
    };

    # plugins
    plugins = {
      lualine.enable = true;
      treesitter.enable = true;
      telescope.enable = true;
      web-devicons.enable = true;
    };

    # colorscheme
    colorschemes.gruvbox.enable = true;
  };
}