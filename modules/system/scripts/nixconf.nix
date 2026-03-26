{
  pkgs,
  lib,
  username,
  config,
  ...
}:
let
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
  options = {
    gb.system.scripts.nixconf.enable = lib.mkEnableOption "NixOs open repo in editor wrapper script";
  };

  config = {
    environment.systemPackages = lib.mkIf config.gb.system.scripts.nixconf.enable [
      nixconf
    ];
  };
}
