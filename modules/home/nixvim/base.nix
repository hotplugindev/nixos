{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./options.nix
    ./keymaps.nix
    ./ui.nix
    ./treesitter.nix
    ./telescope.nix
    ./completion.nix
    ./lsp.nix
    ./editing.nix
    ./git.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
  };
}