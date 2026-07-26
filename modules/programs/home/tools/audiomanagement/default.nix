{ lib, ... }:
{
  imports = [
    ./pavucontrol.nix
    ./noisetorch.nix
  ];

  gb.home.tools.audiomanagement.pavucontrol.enable = lib.mkDefault true;
  gb.home.tools.audiomanagement.noisetorch.enable = lib.mkDefault false;
}
