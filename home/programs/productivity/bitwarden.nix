{
  lib,
  config,
  pkgs,
  ...
}:
let
  bitwarden = config.gb.home.programs.productivity.bitwarden;

  bitwarden-totp = pkgs.writeShellApplication {
    name = "bitwarden-totp";
    runtimeInputs = [
      pkgs.bash
      pkgs.coreutils
    ]
    ++ lib.optionals bitwarden.installOathToolkit [
      pkgs.oath-toolkit
    ];
    text = ''
      set -euo pipefail

      if ! command -v oathtool >/dev/null 2>&1; then
        echo "Error: oathtool is not installed." >&2
        exit 1
      fi

      cleanup() {
        unset SECRET
      }
      trap cleanup EXIT INT TERM

      printf "TOTP secret: " >&2
      IFS= read -r -s SECRET
      printf "\n" >&2

      if [ -z "''${SECRET:-}" ]; then
        echo "Error: empty secret" >&2
        exit 1
      fi

      exec oathtool --totp -b "$SECRET"
    '';
  };

  bitwarden-totp-stdin = pkgs.writeShellApplication {
    name = "bitwarden-totp-stdin";
    runtimeInputs = [
      pkgs.bash
      pkgs.coreutils
    ]
    ++ lib.optionals bitwarden.installOathToolkit [
      pkgs.oath-toolkit
    ];
    text = ''
      set -euo pipefail

      if ! command -v oathtool >/dev/null 2>&1; then
        echo "Error: oathtool is not installed." >&2
        exit 1
      fi

      exec oathtool --totp -b -
    '';
  };
in
{
  options = {
    gb.home.programs.productivity.bitwarden.enable = lib.mkEnableOption "Enables the Bitwarden client";

    gb.home.programs.productivity.bitwarden.installOathToolkit = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Install oath-toolkit for local TOTP generation.";
    };

    gb.home.programs.productivity.bitwarden.enableTotpScript = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable helper scripts for generating TOTP codes from a Bitwarden TOTP secret.";
    };
  };

  config = lib.mkIf bitwarden.enable {
    home.packages = [
      pkgs.bitwarden-desktop
    ]
    ++ lib.optionals bitwarden.installOathToolkit [
      pkgs.oath-toolkit
    ]
    ++ lib.optionals bitwarden.enableTotpScript [
      bitwarden-totp
      bitwarden-totp-stdin
    ];
  };
}
