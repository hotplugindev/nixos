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
      HOST="$(hostname)"
      HW_REL_PATH="hosts/$HOST/hardware-configuration.nix"
      HW_FILE="$REPO/$HW_REL_PATH"
      TMP_FILE="/tmp/hardware-configuration.nix.$USER"

      if [ ! -d "$REPO" ]; then
        echo "Missing repo: $REPO" >&2
        exit 1
      fi

      cd "$REPO"

      if [ ! -f "$HW_FILE" ]; then
        echo "Missing $HW_REL_PATH — nothing to protect" >&2
        git pull
        exit 0
      fi

      echo "Backing up hardware config..."
      cp "$HW_FILE" "$TMP_FILE"

      echo "Allowing git to update hardware file..."
      git update-index --no-assume-unchanged "$HW_REL_PATH"

      echo "Resetting hardware file to repo state..."
      git checkout -- "$HW_REL_PATH" || true

      echo "Pulling latest changes..."
      git pull

      echo "Restoring local hardware config..."
      cp "$TMP_FILE" "$HW_FILE"

      echo "Re-applying assume-unchanged..."
      git update-index --assume-unchanged "$HW_REL_PATH"

      echo "Done ✅"
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
