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
      pkgs.bash
    ];
    text = ''
      set -euo pipefail

      if [ "$(id -u)" -eq 0 ] || [ -n "''${SUDO_USER:-}" ]; then
        echo "system-update must be run as your normal user, not with sudo." >&2
        exit 1
      fi

      REPO="$HOME/nixos"
      HOST="$(hostname)"
      HW_FILE="$REPO/hosts/$HOST/hardware-configuration.nix"

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

      CURRENT_TARGET="$(readlink -f /etc/nixos 2>/dev/null || true)"
      if [ "$CURRENT_TARGET" != "$REPO" ]; then
        echo "/etc/nixos is not linked to $REPO" >&2
        echo "Run ~/nixos/bootstrap.sh first." >&2
        exit 1
      fi

      if ! git -C "$REPO" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo "$REPO is not a git repository" >&2
        exit 1
      fi

      if ! git -C "$REPO" remote get-url origin >/dev/null 2>&1; then
        echo "Git remote 'origin' is not configured for $REPO" >&2
        exit 1
      fi

      has_internet() {
        git -C "$REPO" ls-remote --exit-code origin HEAD >/dev/null 2>&1
      }

      pulled_latest=0
      had_internet=0

      if has_internet; then
        had_internet=1
        echo "Internet connection detected. Pulling latest repo state..."
        if ! git -C "$REPO" pull --no-rebase --no-edit; then
          echo "git pull failed." >&2
          if git -C "$REPO" rev-parse -q --verify MERGE_HEAD >/dev/null 2>&1; then
            echo "Merge conflict detected, aborting merge." >&2
            git -C "$REPO" merge --abort || true
          fi
          exit 1
        fi
        pulled_latest=1
      else
        echo "No internet connection detected."
        printf "Are you sure you want to continue without internet? [y/N] "
        read -r reply
        case "$reply" in
          y|Y|yes|YES)
            echo "Continuing without internet."
            ;;
          *)
            echo "Aborted."
            exit 1
            ;;
        esac
      fi

      git -C "$REPO" add -A

      sudo nixos-rebuild switch --flake "$REPO#$HOST"

      committed=0
      if ! git -C "$REPO" diff --cached --quiet; then
        git -C "$REPO" commit -m "nixos($HOST): switch $(date '+%Y-%m-%d %H:%M:%S')"
        committed=1
      fi

      if [ "$had_internet" -eq 1 ] && [ "$pulled_latest" -eq 1 ]; then
        if [ -n "$(git -C "$REPO" rev-parse --abbrev-ref --symbolic-full-name '@{u}' 2>/dev/null || true)" ]; then
          if [ -n "$(git -C "$REPO" log '@{u}..HEAD' --oneline 2>/dev/null || true)" ]; then
            echo "Pushing changes to origin..."
            git -C "$REPO" push
          else
            echo "Nothing to push."
          fi
        else
          echo "No upstream branch configured; skipping push."
        fi
      elif [ "$committed" -eq 1 ]; then
        echo "Committed locally (offline). Run repo-sync later to push."
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
