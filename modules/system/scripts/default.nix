{ lib, ... }:
{
  imports = [
    ./system-update.nix
    ./nixconf.nix
    ./repo-sync.nix
    ./turbo-toggle.nix
  ];

  gb.system.scripts.system-update.enable = lib.mkDefault true;
  gb.system.scripts.nixconf.enable = lib.mkDefault true;
  gb.system.scripts.repo-sync.enable = lib.mkDefault true;
  gb.system.scripts.turbo-toggle.enable = lib.mkDefault false;
}
