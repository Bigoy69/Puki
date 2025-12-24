#!/bin/bash

# STOP ON ERROR
set -e

echo "========================================================"
echo "   GOD MODE: AUTOMATED SETUP & INFILTRATION SEQUENCE"
echo "========================================================"

echo "[1/4] Installing System Dependencies (apt)..."
apt update
# Replace deprecated libgl1-mesa-glx with libgl1 and libglx-mesa0
apt install -y python3-pip python3-dev git libgl1 libglx-mesa0 libglib2.0-0

echo "[2/4] Installing Pytorch (CUDA)..."
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118 --break-system-packages

echo "[3/4] Installing Requirements..."
# Navigate to script directory to ensure relative paths work if needed
cd "$(dirname "$0")"
pip install -r requirements.txt --break-system-packages --ignore-installed

echo "[4/4] Verifying Installation..."
if command -v accelerate &> /dev/null; then
    echo ">>> Accelerate detected. System is armed and ready."
else
    echo "!!! Accelerate NOT detected. Installation failed."
    exit 1
fi

echo "========================================================"
echo "            SETUP COMPLETE. GOD MODE ACTIVE."
echo "========================================================"
echo ""
echo "Command to run training:"
echo "cd ~/Puki/scripts/sd-script/"
echo "accelerate launch sdxl_train_network.py --config_file /path/to/your-config.toml"
echo ""
