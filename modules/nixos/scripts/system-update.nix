{ pkgs, lib, hostname, ... }:

let
  system-update = pkgs.writeShellScriptBin "system-update" ''
    set -euo pipefail

    REPO="/etc/nixos"
    HOST="${hostname}"

    cd "$REPO"

    git add -A

    if git diff --cached --quiet; then
      sudo nixos-rebuild switch --flake "$REPO#$HOST"
    else
      sudo nixos-rebuild switch --flake "$REPO#$HOST"
      git commit -m "nixos: rebuild $(date '+%Y-%m-%d %H:%M:%S')"
    fi
  '';
in
{
  environment.systemPackages = with pkgs; [
    system-update
  ];

}