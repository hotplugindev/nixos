{
  pkgs,
  lib,
  config,
  ...
}:

let
  turbo-toggle = pkgs.writeShellApplication {
    name = "turbo-toggle";
    runtimeInputs = [
      pkgs.coreutils
      pkgs.bash
    ];
    text = ''
      set -euo pipefail

      TURBO_FILE="/sys/devices/system/cpu/intel_pstate/no_turbo"

      if [ ! -e "$TURBO_FILE" ]; then
        echo "Intel turbo control is not available at $TURBO_FILE" >&2
        exit 1
      fi

      current="$(cat "$TURBO_FILE")"

      case "$current" in
        0)
          echo 1 > "$TURBO_FILE"
          echo "Turbo disabled"
          ;;
        1)
          echo 0 > "$TURBO_FILE"
          echo "Turbo enabled"
          ;;
        *)
          echo "Unexpected value in $TURBO_FILE: $current" >&2
          exit 1
          ;;
      esac
    '';
  };

  turbo-status = pkgs.writeShellApplication {
    name = "turbo-status";
    runtimeInputs = [
      pkgs.coreutils
      pkgs.bash
    ];
    text = ''
      set -euo pipefail

      TURBO_FILE="/sys/devices/system/cpu/intel_pstate/no_turbo"

      if [ ! -e "$TURBO_FILE" ]; then
        echo "unsupported"
        exit 0
      fi

      current="$(cat "$TURBO_FILE")"

      case "$current" in
        0) echo "enabled" ;;
        1) echo "disabled" ;;
        *) echo "unknown" ;;
      esac
    '';
  };
in
{
  options = {
    gb.system.scripts.turbo-toggle.enable =
      lib.mkEnableOption "Intel turbo boost toggle and status scripts";
  };

  config = lib.mkIf config.gb.system.scripts.turbo-toggle.enable {
    environment.systemPackages = [
      turbo-toggle
      turbo-status
    ];

    security.sudo.extraRules = [
      {
        users = [ "giona" ];
        commands = [
          {
            command = "${turbo-toggle}/bin/turbo-toggle";
            options = [ "NOPASSWD" ];
          }
          {
            command = "${turbo-status}/bin/turbo-status";
            options = [ "NOPASSWD" ];
          }
        ];
      }
    ];
  };
}
