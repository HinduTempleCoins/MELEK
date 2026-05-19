#!/bin/bash
# ============================================================
# MELEK Chain Setup Script
# Run on Oracle Cloud Ubuntu 20.04 or 22.04
# Sets up melek-chain source from BLURT fork with MELEK params
# ============================================================

set -e

echo "=== MELEK Chain Setup ==="
echo "Oracle Cloud Ubuntu — BLURT fork → MELEK"
echo ""

# ---- Step 1: Dependencies ----
echo ">>> [1/5] Installing dependencies..."
sudo apt-get update -y
sudo apt-get install -y \
    autoconf \
    automake \
    cmake \
    g++ \
    git \
    libbz2-dev \
    libsnappy-dev \
    libssl-dev \
    libtool \
    make \
    pkg-config \
    python3 \
    python3-jinja2 \
    libboost-chrono-dev \
    libboost-context-dev \
    libboost-coroutine-dev \
    libboost-date-time-dev \
    libboost-filesystem-dev \
    libboost-iostreams-dev \
    libboost-locale-dev \
    libboost-program-options-dev \
    libboost-serialization-dev \
    libboost-signals-dev \
    libboost-system-dev \
    libboost-test-dev \
    libboost-thread-dev

echo ">>> Dependencies installed."
echo ""

# ---- Step 2: Clone BLURT ----
echo ">>> [2/5] Cloning BLURT source..."
git clone https://github.com/Blurt-Blockchain/blurt.git melek-chain
cd melek-chain
git submodule update --init --recursive
echo ">>> BLURT cloned."
echo ""

# ---- Step 3: Apply MELEK customizations ----
echo ">>> [3/5] Applying MELEK customizations to config.hpp..."

CONFIG="libraries/protocol/include/blurt/protocol/config.hpp"

# Token symbol
sed -i 's/BLURT_SYMBOL_SER\s*"BLURT"/BLURT_SYMBOL_SER  "MELEK"/g' "$CONFIG"

# Address prefix
sed -i 's/BLURT_ADDRESS_PREFIX\s*"BLT"/BLURT_ADDRESS_PREFIX "MELEK"/g' "$CONFIG"

# Chain ID
sed -i 's/fc::sha256::hash("blurt")/fc::sha256::hash("melek")/g' "$CONFIG"

# Block interval
# NOTE: Standard Graphene stores block interval as integer seconds.
# MELEK requires 4.5 seconds. This needs the fc time layer modified
# to millisecond precision (BLURT_BLOCK_INTERVAL_MS = 4500).
# For initial testnet, using 4 seconds as working placeholder.
# TODO: implement 4.5s via millisecond precision before mainnet.
sed -i 's/#define BLURT_BLOCK_INTERVAL\s*[0-9]*/#define BLURT_BLOCK_INTERVAL 4/g' "$CONFIG"

# Emission: 300 years flat then zero
# Blocks per year at 4s: 365.25 * 24 * 3600 / 4 = 7,884,000
# 300 years = 2,365,200,000 blocks
# The BLURT emission model needs review — flat-then-zero is a custom schedule
# TODO: implement cutoff block height = 2,365,200,000
echo ">>> config.hpp customized."
echo ""

# ---- Step 4: Set git remote to melek-chain repo ----
echo ">>> [4/5] Setting git remote..."
git remote rename origin blurt-upstream
git remote add origin https://github.com/HinduTempleCoins/melek-chain.git
echo ">>> Remote set. Push with: git push -u origin main"
echo ""

# ---- Step 5: Build ----
echo ">>> [5/5] Building (this takes 30-60 minutes)..."
mkdir -p build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DLOW_MEMORY_NODE=OFF ..
make -j$(nproc) witness_node
make -j$(nproc) cli_wallet
echo ""
echo "=== Build complete ==="
echo "Binaries at: melek-chain/build/programs/"
echo ""
echo "NEXT: Generate your witness keys with cli_wallet --suggest-brain-key"
echo ""
echo "OPEN ITEMS before mainnet:"
echo "  1. Implement 4.5s block time via millisecond precision in fc layer"
echo "  2. Implement flat emission cutoff at block 2,365,200,000"
echo "  3. Verify all BLURT references replaced throughout codebase"
