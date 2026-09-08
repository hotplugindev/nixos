{ lib, ... }:
{
  imports = [
    ./lsp.nix
    ./formatting.nix
    ./linting.nix
    ./dap.nix
  ];

  gb.home.dev.nixvim.coding.lsp.enable = lib.mkDefault true;
  gb.home.dev.nixvim.coding.formatting.enable = lib.mkDefault true;
  gb.home.dev.nixvim.coding.linting.enable = lib.mkDefault true;
  gb.home.dev.nixvim.coding.dap.enable = lib.mkDefault true;
}
