{ lib, ... }:
{
  imports = [
    ./general.nix
    ./window.nix
    ./buffers.nix
    ./find.nix
    ./git.nix
    ./lsp.nix
    ./terminal.nix
    ./avante.nix
  ];

  gb.home.dev.nixvim.keymaps.general.enable = lib.mkDefault true;
  gb.home.dev.nixvim.keymaps.window.enable = lib.mkDefault true;
  gb.home.dev.nixvim.keymaps.buffers.enable = lib.mkDefault true;
  gb.home.dev.nixvim.keymaps.find.enable = lib.mkDefault true;
  gb.home.dev.nixvim.keymaps.git.enable = lib.mkDefault true;
  gb.home.dev.nixvim.keymaps.lsp.enable = lib.mkDefault true;
  gb.home.dev.nixvim.keymaps.terminal.enable = lib.mkDefault true;
  gb.home.dev.nixvim.keymaps.avante.enable = lib.mkDefault false;
}
