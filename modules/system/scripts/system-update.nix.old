{
  pkgs,
  lib,
  config,
  ...
}:

let
  system-update = pkgs.writeShellApplication {
    name = "system-update";
    runtimeInputs = [
      pkgs.git
      pkgs.coreutils
      pkgs.hostname
    ];
    text = ''
      set -euo pipefail

      if [ "$(id -u)" -eq 0 ] || [ -n "''${SUDO_USER:-}" ]; then
        echo "system-update must be run as your normal user, not with sudo." >&2
        exit 1
      fi

      REPO="$HOME/nixos"
      HOST="$(hostname)"
      HW_FILE="$REPO/hosts/$(hostname)/hardware-configuration.nix"
      HW_REL_PATH="hosts/$HOST/hardware-configuration.nix"

      if [ ! -d "$REPO" ]; then
        echo "Missing repo: $REPO" >&2
        exit 1
      fi

      if [ ! -f "$REPO/flake.nix" ]; then
        echo "No flake.nix found in $REPO" >&2
        exit 1
      fi

      if [ ! -f "$HW_FILE" ]; then
        echo "Missing $HW_FILE" >&2
        echo "Run ~/nixos/bootstrap.sh first." >&2
        exit 1
      fi

      if ! git -C "$REPO" ls-files --error-unmatch "$HW_REL_PATH" >/dev/null 2>&1; then
        git -C "$REPO" add --intent-to-add "$HW_REL_PATH"
      fi
      git -C "$REPO" update-index --assume-unchanged "$HW_REL_PATH"

      CURRENT_TARGET="$(readlink -f /etc/nixos 2>/dev/null || true)"
      if [ "$CURRENT_TARGET" != "$REPO" ]; then
        echo "/etc/nixos is not linked to $REPO" >&2
        echo "Run ~/nixos/bootstrap.sh first." >&2
        exit 1
      fi

      git -C "$REPO" add -A

      sudo nixos-rebuild switch --flake "$REPO#$HOST"

      if ! git -C "$REPO" diff --cached --quiet; then
        git -C "$REPO" commit -m "nixos: switch $HOST $(date '+%Y-%m-%d %H:%M:%S')"
      fi
    '';
  };
in
{
  options = {
    gb.system.scripts.system-update.enable = lib.mkEnableOption "System Update Script";
  };
  config = {
    environment.systemPackages = lib.mkIf config.gb.system.scripts.system-update.enable [
      system-update
    ];
  };
}
