{ lib, ... }:
{
  imports = [
    ./obsidian.nix
    ./onlyoffice.nix
    ./gimp.nix
    ./nextcloud.nix
    ./bitwarden.nix
    ./shotcut.nix
    ./davinci-resolve.nix
    ./logseq.nix
  ];
}
