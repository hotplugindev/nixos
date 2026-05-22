{ lib, ... }:
{
  imports = [
    ./spotify.nix
    ./showtime.nix
  ];

  gb.home.programs.multimedia.spotify.enable = lib.mkDefault true;
  gb.home.programs.multimedia.showtime.enable = lib.mkDefault true;
}
