#!/usr/bin/env bash
set -euo pipefail

CALIBRE_VERSION="9.17.0"

# Install dependencies for Calibre
sudo apt update
sudo apt install -y \
    python-is-python3 \
    libglx0 \
    libegl1 \
    libopengl0 \
    libxkbcommon0 \
    libxcb-cursor0

# Install Calibre
# https://calibre-ebook.com/download_linux
sudo wget --no-config -nv -o /dev/null -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin version=$CALIBRE_VERSION