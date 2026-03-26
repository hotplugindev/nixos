{ lib, ... }:
{
  imports = [
    ./spotify.nix
  ];

  gb.home.programs.multimedia.spotify.enable = lib.mkDefault true;
}
