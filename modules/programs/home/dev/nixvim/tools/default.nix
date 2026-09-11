{ lib, ... }:
{
  imports = [
    ./gitsigns.nix
    ./neogit.nix
    ./diffview.nix
    ./gitlinker.nix
    ./gh-nvim.nix
    ./avante.nix
  ];

  gb.home.dev.nixvim.tools.gitsigns.enable = lib.mkDefault true;
  gb.home.dev.nixvim.tools.neogit.enable = lib.mkDefault true;
  gb.home.dev.nixvim.tools.diffview.enable = lib.mkDefault true;
  gb.home.dev.nixvim.tools.gitlinker.enable = lib.mkDefault true;
  gb.home.dev.nixvim.tools.gh-nvim.enable = lib.mkDefault false;
  gb.home.dev.nixvim.tools.avante.enable = lib.mkDefault false;
}
