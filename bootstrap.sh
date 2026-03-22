#!/usr/bin/env bash
set -euo pipefail

REPO="${HOME}/nixos"
HW_FILE="${REPO}/hardware-configuration.nix"

if [ ! -d "${REPO}" ]; then
  echo "Missing repo: ${REPO}" >&2
  exit 1
fi

if [ ! -f "${REPO}/flake.nix" ]; then
  echo "flake.nix not found in ${REPO}" >&2
  exit 1
fi

if ! git -C "${REPO}" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "${REPO} is not a git repository." >&2
  exit 1
fi

HOST="${1:-}"

if [ -z "${HOST}" ]; then
  echo "Select target system:"
  echo "1) pc"
  echo "2) laptop"
  read -rp "Enter choice [1-2]: " choice

  case "${choice}" in
    1) HOST="pc" ;;
    2) HOST="laptop" ;;
    *)
      echo "Invalid choice" >&2
      exit 1
      ;;
  esac
fi

case "${HOST}" in
  pc|laptop) ;;
  *)
    echo "Invalid host: ${HOST}" >&2
    echo "Use: ./bootstrap.sh pc  or  ./bootstrap.sh laptop" >&2
    exit 1
    ;;
esac

if [ ! -f "${HW_FILE}" ]; then
  if [ -f /etc/nixos/hardware-configuration.nix ]; then
    echo "Copying installer hardware config into repo..."
    sudo cp /etc/nixos/hardware-configuration.nix "${HW_FILE}"
    sudo chown "$USER:$(id -gn)" "${HW_FILE}"
  else
    echo "Generating hardware config into repo..."
    sudo sh -c 'nixos-generate-config --show-hardware-config > "$1"' sh "${HW_FILE}"
    sudo chown "$USER:$(id -gn)" "${HW_FILE}"
  fi
fi

if ! git -C "${REPO}" ls-files --error-unmatch hardware-configuration.nix >/dev/null 2>&1; then
  git -C "${REPO}" add --intent-to-add hardware-configuration.nix
fi
git -C "${REPO}" update-index --assume-unchanged hardware-configuration.nix

CURRENT_TARGET="$(readlink -f /etc/nixos 2>/dev/null || true)"
if [ "${CURRENT_TARGET}" != "${REPO}" ]; then
  echo "Linking /etc/nixos -> ${REPO}"
  if [ -e /etc/nixos ] && [ ! -L /etc/nixos ]; then
    sudo mv /etc/nixos "/etc/nixos.backup.$(date +%Y%m%d-%H%M%S)"
  else
    sudo rm -f /etc/nixos
  fi
  sudo ln -s "${REPO}" /etc/nixos
fi

sudo nixos-rebuild switch --flake "${REPO}#${HOST}"