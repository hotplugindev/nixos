{
  pkgs,
  lib,
  username,
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

      if ! git -C "$REPO" ls-files --error-unmatch hardware-configuration.nix >/dev/null 2>&1; then
        git -C "$REPO" add --intent-to-add hardware-configuration.nix
      fi
      git -C "$REPO" update-index --assume-unchanged hardware-configuration.nix

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

  repo-sync = pkgs.writeShellApplication {
    name = "repo-sync";
    runtimeInputs = [
      pkgs.git
      pkgs.coreutils
      pkgs.bash
    ];
    text = ''
      set -euo pipefail

      if [ "$(id -u)" -eq 0 ] || [ -n "''${SUDO_USER:-}" ]; then
        echo "repo-sync must be run as your normal user, not with sudo." >&2
        exit 1
      fi

      REPO="$HOME/nixos"
      HW_FILE="$REPO/hardware-configuration.nix"
      TMP_FILE="/tmp/hardware-configuration.nix.$USER"

      if [ ! -d "$REPO" ]; then
        echo "Missing repo: $REPO" >&2
        exit 1
      fi

      cd "$REPO"

      if [ ! -f "$HW_FILE" ]; then
        echo "Missing hardware-configuration.nix — nothing to protect" >&2
        git pull
        exit 0
      fi

      echo "Backing up hardware config..."
      cp "$HW_FILE" "$TMP_FILE"

      echo "Allowing git to update hardware file..."
      git update-index --no-assume-unchanged hardware-configuration.nix

      echo "Resetting hardware file to repo state..."
      git checkout -- hardware-configuration.nix || true

      echo "Pulling latest changes..."
      git pull

      echo "Restoring local hardware config..."
      cp "$TMP_FILE" "$HW_FILE"

      echo "Re-applying assume-unchanged..."
      git update-index --assume-unchanged hardware-configuration.nix

      echo "Done ✅"
    '';
  };

  nixconf = pkgs.writeShellApplication {
    name = "nixconf";
    runtimeInputs = [ pkgs.bash ];
    text = ''
      set -euo pipefail

      if [ "$(id -u)" -eq 0 ] || [ -n "''${SUDO_USER:-}" ]; then
        echo "nixconf must be run as your normal user, not with sudo." >&2
        exit 1
      fi

      REPO="$HOME/nixos"

      if [ ! -d "$REPO" ]; then
        echo "Missing repo: $REPO" >&2
        exit 1
      fi

      cd "$REPO"
      exec nvim .
    '';
  };
in
{
  environment.systemPackages = [
    system-update
    nixconf
    repo-sync
  ];
}
