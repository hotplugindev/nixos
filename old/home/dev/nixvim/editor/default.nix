{ lib, ... }:
{
  imports = [
    ./treesitter.nix
    ./completion.nix
    ./editing.nix
    ./terminal.nix
  ];

  gb.home.dev.nixvim.editor.treesitter.enable = lib.mkDefault true;
  gb.home.dev.nixvim.editor.completion.enable = lib.mkDefault true;
  gb.home.dev.nixvim.editor.editing.enable = lib.mkDefault true;
  gb.home.dev.nixvim.editor.terminal.enable = lib.mkDefault true;
}
