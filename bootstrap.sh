#!/usr/bin/env bash
set -euo pipefail

REPO="${HOME}/nixos"

# 1. Get Host (pc or laptop)
HOST="${1:-}"
if [ -z "${HOST}" ]; then
  read -rp "Select target [pc/laptop]: " HOST
fi

# 2. Define and Create Directory
HW_DIR="${REPO}/hosts/${HOST}"
HW_FILE="${HW_DIR}/hardware-configuration.nix"
mkdir -p "${HW_DIR}"

# 3. Generate Hardware Config if missing
if [ ! -f "${HW_FILE}" ]; then
  echo "Generating hardware-configuration.nix for ${HOST}..."
  # nixos-generate-config usually needs sudo to read hardware IDs accurately
  sudo nixos-generate-config --show-hardware-config > "${HW_FILE}"
  sudo chown "$USER:$(id -gn)" "${HW_FILE}"
fi

# 4. Clean up Git & Stage (No more assume-unchanged!)
git -C "${REPO}" update-index --no-assume-unchanged "hosts/${HOST}/hardware-configuration.nix" 2>/dev/null || true
git -C "${REPO}" add "${HW_DIR}"

# 5. Switch
sudo nixos-rebuild switch --flake "${REPO}#${HOST}"
