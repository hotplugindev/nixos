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
      HW_FILE="$REPO/hardware-configuration.nix"

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
  ];
}
