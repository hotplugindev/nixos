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
}
