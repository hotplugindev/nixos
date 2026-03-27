{
  pkgs,
  lib,
  config,
  ...
}:

let
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

      if [ ! -d "$REPO" ]; then
        echo "Missing repo: $REPO" >&2
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

      if ! git -C "$REPO" diff --quiet || ! git -C "$REPO" diff --cached --quiet; then
        echo "Working tree is not clean. Commit or stash your changes before running repo-sync." >&2
        exit 1
      fi

      echo "Pulling latest changes from origin..."
      if ! git -C "$REPO" pull --no-rebase --no-edit; then
        echo "git pull failed." >&2
        if git -C "$REPO" rev-parse -q --verify MERGE_HEAD >/dev/null 2>&1; then
          echo "Merge conflict detected, aborting merge." >&2
          git -C "$REPO" merge --abort || true
        fi
        exit 1
      fi

      if [ -z "$(git -C "$REPO" rev-parse --abbrev-ref --symbolic-full-name '@{u}' 2>/dev/null || true)" ]; then
        echo "No upstream branch configured for the current branch; cannot determine push status." >&2
        exit 1
      fi

      if [ -n "$(git -C "$REPO" log '@{u}..HEAD' --oneline 2>/dev/null || true)" ]; then
        echo "Unpushed commits detected. Pushing..."
        git -C "$REPO" push
      else
        echo "No unpushed commits."
      fi
    '';
  };
in
{
  options = {
    gb.system.scripts.repo-sync.enable = lib.mkEnableOption "NixOs open repo in editor wrapper script";
  };

  config = {
    environment.systemPackages = lib.mkIf config.gb.system.scripts.repo-sync.enable [
      repo-sync
    ];
  };
}
