{ lib, ... }:
{
  imports = [
    ./polkit.nix
    ./rtkit.nix
    ./gnupg.nix
  ];

  gb.system.security.polkit.enable = lib.mkDefault true;
  gb.system.security.rtkit.enable = lib.mkDefault true;
  gb.system.security.gnupg.enable = lib.mkDefault true;
}
