#!/bin/bash
# ============================================================
# MELEK Condenser Setup Script
# Forks the BLURT frontend and rebrands to MELEK
# Run on Oracle Cloud or any Node.js dev environment
# ============================================================

set -e

echo "=== MELEK Condenser Setup ==="
echo "BLURT Condenser → MELEK frontend"
echo ""

# ---- Step 1: Dependencies ----
echo ">>> [1/4] Installing Node.js dependencies..."
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs
node --version
npm --version
echo ""

# ---- Step 2: Clone BLURT Condenser ----
echo ">>> [2/4] Cloning BLURT Condenser..."
git clone https://github.com/Blurt-Blockchain/condenser.git melek-condenser
cd melek-condenser
echo ""

# ---- Step 3: Apply MELEK rebranding ----
echo ">>> [3/4] Applying MELEK rebranding..."

# Rename token references
find . -type f \( -name "*.js" -o -name "*.jsx" -o -name "*.json" -o -name "*.yml" -o -name "*.yaml" -o -name "*.md" \) \
    -not -path "*/node_modules/*" \
    -not -path "*/.git/*" \
    -exec sed -i \
        -e 's/BLURT/MELEK/g' \
        -e 's/Blurt/Melek/g' \
        -e 's/blurt/melek/g' \
        {} +

# Update chain config
CONFIG="config/default.json"
if [ -f "$CONFIG" ]; then
    # Point to MELEK nodes (update these IPs once Oracle nodes are running)
    sed -i 's|"ws://.*:8090"|"ws://YOUR_ORACLE_IP:8090"|g' "$CONFIG"
    sed -i 's|"https://.*rpc.*"|"https://rpc.melek.salon"|g' "$CONFIG"
    echo ">>> config/default.json updated — set Oracle node IP when ready"
fi

# Set git remote
git remote rename origin blurt-upstream
git remote add origin https://github.com/HinduTempleCoins/melek-condenser.git

echo ">>> Rebranding applied."
echo ""

# ---- Step 4: Logo placeholder ----
echo ">>> [4/4] Logo note..."
echo ""
echo "  The MELEK logo is the Kurdish flag in horizontal orientation:"
echo "  Red stripe / White stripe with 21-ray gold sun / Green stripe"
echo ""
echo "  Replace these files with the Kurdish flag SVG:"
echo "    src/app/assets/images/logo.svg  (or .png)"
echo "    src/app/assets/images/favicon.ico"
echo "    src/app/assets/images/logo-small.svg"
echo ""
echo "  Kurdish flag colors:"
echo "    Red:   #D01C1F"
echo "    White: #FFFFFF"
echo "    Green: #007A3D"
echo "    Sun:   #F7C815"
echo ""

echo "=== Setup complete ==="
echo ""
echo "Next steps:"
echo "  1. Add Kurdish flag logo files to src/app/assets/images/"
echo "  2. Set Oracle node IP in config/default.json"
echo "  3. npm install && npm run build"
echo "  4. git push -u origin main"
