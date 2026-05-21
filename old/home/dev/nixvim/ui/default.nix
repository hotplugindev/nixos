{ lib, ... }:
{
  imports = [
    ./theme.nix
    ./statusline.nix
    ./bufferline.nix
    ./dashboard.nix
    ./notifications.nix
  ];

  gb.home.dev.nixvim.ui.theme.enable = lib.mkDefault true;
  gb.home.dev.nixvim.ui.statusline.enable = lib.mkDefault true;
  gb.home.dev.nixvim.ui.bufferline.enable = lib.mkDefault true;
  gb.home.dev.nixvim.ui.dashboard.enable = lib.mkDefault true;
  gb.home.dev.nixvim.ui.notifications.enable = lib.mkDefault true;
}
