{ lib, ... }:
{
  imports = [
    ./brave.nix
    ./firefox.nix
    ./google-chrome.nix
    ./librewolf.nix
    ./torbrowser.nix
  ];

  gb.home.programs.web.brave.enable = lib.mkDefault true;
  gb.home.programs.web.firefox.enable = lib.mkDefault true;
  gb.home.programs.web.torbrowser.enable = lib.mkDefault true;

  gb.home.programs.web.librewolf.enable = lib.mkDefault false;
  gb.home.programs.web.google-chrome.enable = lib.mkDefault false;
}
