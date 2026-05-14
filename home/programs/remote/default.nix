{ lib, ... }:
{
  imports = [
    ./remmina.nix
    ./tigervnc.nix
    ./moonshine.nix
  ];

  gb.home.programs.remote.remmina.enable = lib.mkDefault false;
  gb.home.programs.remote.tigervnc.enable = lib.mkDefault false;
  gb.home.programs.remote.moonshine.enable = lib.mkDefault false;
}
