#!/usr/bin/env bash
# setup_env.sh — HVAI Python Environment Setup
# Run this script once to set up a consistent Python development environment.
# Usage: bash setup_env.sh

set -e

# ── Colors ──────────────────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

info()    { echo -e "${GREEN}[INFO]${NC} $1"; }
warn()    { echo -e "${YELLOW}[WARN]${NC} $1"; }
error()   { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

# ── Configuration ────────────────────────────────────────────────────────────
PYTHON_VERSION="3.10"
VENV_DIR=".venv"
TORCH_VERSION="2.9.1"
TORCHVISION_VERSION="0.24.1"
TORCHAUDIO_VERSION="2.9.1"
TORCH_INDEX_URL="https://download.pytorch.org/whl/cpu"

echo ""
echo "=================================================="
echo "  HVAI Python Environment Setup"
echo "=================================================="
echo ""

# ── Step 1: Check Python 3.10 ────────────────────────────────────────────────
info "[1/4] Checking Python ${PYTHON_VERSION}..."

PYTHON_BIN=""
for cmd in python3.10 python3 python; do
    if command -v "$cmd" &>/dev/null; then
        version=$("$cmd" --version 2>&1 | grep -oP '3\.10\.\d+')
        if [ -n "$version" ]; then
            PYTHON_BIN="$cmd"
            info "  Found: $cmd ($version)"
            break
        fi
    fi
done

if [ -z "$PYTHON_BIN" ]; then
    error "Python ${PYTHON_VERSION} not found. Install it first:\n\
  Ubuntu:  sudo add-apt-repository ppa:deadsnakes/ppa\n\
           sudo apt install python3.10 python3.10-venv python3.10-dev\n\
  macOS:   brew install python@3.10"
fi

# ── Step 2: Create virtual environment ───────────────────────────────────────
info "[2/4] Setting up virtual environment (${VENV_DIR})..."

if [ -d "${VENV_DIR}" ]; then
    warn "  '${VENV_DIR}' already exists. Skipping creation."
else
    "$PYTHON_BIN" -m venv "${VENV_DIR}"
    info "  Created ${VENV_DIR}/"
fi

VENV_PYTHON="${VENV_DIR}/bin/python"
VENV_PIP="${VENV_DIR}/bin/pip"

# Upgrade pip
"${VENV_PIP}" install --quiet --upgrade pip

# ── Step 3: Install packages ─────────────────────────────────────────────────
info "[3/4] Installing packages..."

# PyTorch (CPU-only, requires special index URL)
info "  Installing PyTorch ${TORCH_VERSION}+cpu..."
"${VENV_PIP}" install --quiet \
    torch=="${TORCH_VERSION}" \
    torchvision=="${TORCHVISION_VERSION}" \
    torchaudio=="${TORCHAUDIO_VERSION}" \
    --index-url "${TORCH_INDEX_URL}"

# Other packages
info "  Installing packages from requirements.txt..."
"${VENV_PIP}" install --quiet -r requirements.txt

# ── Step 4: Verify ───────────────────────────────────────────────────────────
info "[4/4] Verifying installation..."

"${VENV_PYTHON}" - <<'EOF'
import sys
import torch
import numpy
import scipy
import cv2
import matplotlib

print(f"  Python:      {sys.version.split()[0]}")
print(f"  PyTorch:     {torch.__version__}")
print(f"  NumPy:       {numpy.__version__}")
print(f"  SciPy:       {scipy.__version__}")
print(f"  OpenCV:      {cv2.__version__}")
print(f"  Matplotlib:  {matplotlib.__version__}")
EOF

echo ""
echo "=================================================="
echo -e "  ${GREEN}Setup complete!${NC}"
echo "=================================================="
echo ""
echo "Activate the environment:"
echo "  source ${VENV_DIR}/bin/activate"
echo ""
echo "Or run Python directly:"
echo "  ./${VENV_DIR}/bin/python your_script.py"
echo ""
