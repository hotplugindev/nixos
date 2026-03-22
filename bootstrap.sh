#!/usr/bin/env bash
set -euo pipefail

REPO="${HOME}/nixos"
HOST="$(hostname)"

if [ ! -f "${REPO}/flake.nix" ]; then
  echo "flake.nix not found in ${REPO}" >&2
  exit 1
fi

if [ ! -f "${REPO}/.gitignore" ]; then
  touch "${REPO}/.gitignore"
fi

if ! grep -qxF "hardware-configuration.nix" "${REPO}/.gitignore"; then
  echo "hardware-configuration.nix" >> "${REPO}/.gitignore"
fi

if [ ! -f "${REPO}/hardware-configuration.nix" ]; then
  if [ -f /etc/nixos/hardware-configuration.nix ]; then
    sudo cp /etc/nixos/hardware-configuration.nix "${REPO}/hardware-configuration.nix"
    sudo chown "$USER:$(id -gn)" "${REPO}/hardware-configuration.nix"
  else
    sudo sh -c 'nixos-generate-config --show-hardware-config > "$1"' sh "${REPO}/hardware-configuration.nix"
    sudo chown "$USER:$(id -gn)" "${REPO}/hardware-configuration.nix"
  fi
fi

CURRENT_TARGET="$(readlink -f /etc/nixos 2>/dev/null || true)"
if [ "${CURRENT_TARGET}" != "${REPO}" ]; then
  if [ -e /etc/nixos ] && [ ! -L /etc/nixos ]; then
    sudo mv /etc/nixos "/etc/nixos.backup.$(date +%Y%m%d-%H%M%S)"
  else
    sudo rm -f /etc/nixos
  fi
  sudo ln -s "${REPO}" /etc/nixos
fi

sudo nixos-rebuild switch --flake "${REPO}#${HOST}"
