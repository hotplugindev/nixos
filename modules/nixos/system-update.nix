{ pkgs, lib, ... }:

let
  system-updadate = pkgs.writeShellScriptBin "system-update" ''
    set -euo pipefail

    REPO="/etc/nixos"
    HOST="pc"

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