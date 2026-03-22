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
      pkgs.findutils
      pkgs.gnugrep
      pkgs.gnused
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
      HW_FILE="$REPO/hardware-configuration.nix"
      ETC_NIXOS="/etc/nixos"
      SUDO="/run/wrappers/bin/sudo"
      REBUILD="/run/current-system/sw/bin/nixos-rebuild"

      if [ ! -d "$REPO" ]; then
        echo "Missing repo: $REPO" >&2
        echo "Clone your repo into ~/nixos first." >&2
        exit 1
      fi

      if [ ! -f "$REPO/flake.nix" ]; then
        echo "No flake.nix found in $REPO" >&2
        exit 1
      fi

      if ! git -C "$REPO" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo "$REPO is not a git repository." >&2
        exit 1
      fi

      # Ensure .gitignore contains the local hardware file
      if [ ! -f "$REPO/.gitignore" ]; then
        touch "$REPO/.gitignore"
      fi

      if ! grep -qxF "hardware-configuration.nix" "$REPO/.gitignore"; then
        echo "hardware-configuration.nix" >> "$REPO/.gitignore"
      fi

      # Bootstrap local hardware config from the installer-generated one
      if [ ! -f "$HW_FILE" ]; then
        if [ -f "$ETC_NIXOS/hardware-configuration.nix" ] && [ ! -L "$ETC_NIXOS" ]; then
          echo "Copying existing /etc/nixos/hardware-configuration.nix into repo..."
          "$SUDO" cp "$ETC_NIXOS/hardware-configuration.nix" "$HW_FILE"
          "$SUDO" chown "$USER:$(id -gn)" "$HW_FILE"
        else
          echo "Generating hardware-configuration.nix into repo..."
          "$SUDO" sh -c 'nixos-generate-config --show-hardware-config > "$1"' sh "$HW_FILE"
          "$SUDO" chown "$USER:$(id -gn)" "$HW_FILE"
        fi
      fi

      # Make /etc/nixos point to the repo
      CURRENT_TARGET="$(readlink -f "$ETC_NIXOS" 2>/dev/null || true)"
      if [ "$CURRENT_TARGET" != "$REPO" ]; then
        echo "Linking $ETC_NIXOS -> $REPO"
        if [ -e "$ETC_NIXOS" ] && [ ! -L "$ETC_NIXOS" ]; then
          BACKUP="/etc/nixos.backup.$(date +%Y%m%d-%H%M%S)"
          "$SUDO" mv "$ETC_NIXOS" "$BACKUP"
          echo "Backed up old /etc/nixos to $BACKUP"
        else
          "$SUDO" rm -f "$ETC_NIXOS"
        fi
        "$SUDO" ln -s "$REPO" "$ETC_NIXOS"
      fi

      git -C "$REPO" add -A

      "$SUDO" "$REBUILD" switch --flake "$REPO#$HOST"

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
