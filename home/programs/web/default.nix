{ lib, ... }:
{
  imports = [
    ./brave.nix
    ./firefox.nix
    ./google-chrome.nix
  ];

  gb.home.programs.web.brave.enable = lib.mkDefault true;
  gb.home.programs.web.firefox.enable = lib.mkDefault true;
  gb.home.programs.web.google-chrome.enable = lib.mkDefault true;
}
