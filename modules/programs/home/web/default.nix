{ lib, ... }:
{
  imports = [
    ./brave.nix
    ./firefox.nix
    ./google-chrome.nix
    ./librewolf.nix
    ./torbrowser.nix
  ];
}
