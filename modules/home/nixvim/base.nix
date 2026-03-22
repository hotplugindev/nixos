{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim

    ./core/options.nix
    ./core/keymaps.nix
    ./core/autocmds.nix

    ./ui/theme.nix
    ./ui/statusline.nix
    ./ui/bufferline.nix
    ./ui/dashboard.nix
    ./ui/notifications.nix

    ./editor/treesitter.nix
    ./editor/completion.nix
    ./editor/editing.nix
    ./editor/terminal.nix

    ./navigation/explorer.nix
    ./navigation/telescope.nix

    ./coding/lsp.nix
    ./coding/formatting.nix
    ./coding/linting.nix

    ./tools/git.nix
    ./tools/avante.nix
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