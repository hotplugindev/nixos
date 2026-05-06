{ lib, ... }:
{
  imports = [
    ./obsidian.nix
    ./onlyoffice.nix
    ./gimp.nix
    ./nextcloud.nix
    ./bitwarden.nix
    ./shotcut.nix
  ];

  gb.home.programs.productivity.obsidian.enable = lib.mkDefault true;
  gb.home.programs.productivity.onlyoffice.enable = lib.mkDefault true;
  gb.home.programs.productivity.gimp.enable = lib.mkDefault true;

  gb.home.programs.productivity.nextcloud.enable = lib.mkDefault true;
  gb.home.programs.productivity.bitwarden.enable = lib.mkDefault true;

  gb.home.programs.productivity.shotcut.enable = lib.mkDefault false;
}
