{ lib, ... }:
{
  imports = [
    ./system/default.nix
    ./desktop/default.nix
    ./programs/default.nix
    ./nix/default.nix
  ];

  system.stateVersion = "25.11";
}
