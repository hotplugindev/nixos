{ lib, ... }:
{
  imports = [
    ./remmina.nix
    ./tigervnc.nix
    ./moonlight-qt.nix
  ];

  gb.home.programs.remote.remmina.enable = lib.mkDefault false;
  gb.home.programs.remote.tigervnc.enable = lib.mkDefault false;
  gb.home.programs.remote.moonlight-qt.enable = lib.mkDefault false;
}
