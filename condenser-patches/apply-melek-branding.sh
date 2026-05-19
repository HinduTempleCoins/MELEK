#!/bin/bash
# ============================================================
# Apply MELEK branding to melek-condenser
# Run from the ROOT of the melek-condenser repo
# ============================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== Applying MELEK branding to condenser ==="
echo ""

# ---- Token / name replacements ----
echo ">>> [1/5] Replacing BLURT references with MELEK..."
find . -type f \( -name "*.js" -o -name "*.jsx" -o -name "*.ts" -o -name "*.tsx" -o -name "*.json" -o -name "*.yml" -o -name "*.yaml" -o -name "*.md" -o -name "*.html" \) \
    -not -path "*/node_modules/*" \
    -not -path "*/.git/*" \
    -exec sed -i \
        -e 's/BLURT/MELEK/g' \
        -e 's/Blurt/Melek/g' \
        -e 's/blurt/melek/g' \
        {} +
echo ">>> Done."

# ---- Logo files ----
echo ">>> [2/5] Installing Kurdish flag logo..."
IMAGES_DIR="src/app/assets/images"
mkdir -p "$IMAGES_DIR"
cp "$SCRIPT_DIR/src/app/assets/images/logo.svg" "$IMAGES_DIR/logo.svg"
cp "$SCRIPT_DIR/src/app/assets/images/logo-small.svg" "$IMAGES_DIR/logo-small.svg"
echo ">>> Logos installed at $IMAGES_DIR/"

# ---- Chain RPC node ----
echo ">>> [3/5] Updating RPC node config..."
CONFIG="config/default.json"
if [ -f "$CONFIG" ]; then
    # Replace any ws:// node URLs with melek RPC
    sed -i 's|"ws://[^"]*"|"wss://rpc.melek.salon"|g' "$CONFIG"
    sed -i 's|"wss://[^"]*"|"wss://rpc.melek.salon"|g' "$CONFIG"
    # Replace any https:// API URLs
    sed -i 's|"https://[^"]*rpc[^"]*"|"https://rpc.melek.salon"|g' "$CONFIG"
    echo ">>> config/default.json updated."
    echo "    NOTE: Update the Oracle IP in config/default.json once node is running."
else
    echo ">>> WARNING: config/default.json not found — skip node config update."
fi

# ---- package.json name ----
echo ">>> [4/5] Updating package.json..."
if [ -f "package.json" ]; then
    sed -i 's/"name": "[^"]*"/"name": "melek-condenser"/' package.json
    sed -i 's/"description": "[^"]*"/"description": "MELEK blockchain frontend"/' package.json
    echo ">>> package.json updated."
fi

# ---- Title / metadata ----
echo ">>> [5/5] Updating HTML title and meta tags..."
find . -name "index.html" -not -path "*/node_modules/*" \
    -exec sed -i 's/<title>[^<]*<\/title>/<title>MELEK<\/title>/g' {} +
echo ">>> Done."

echo ""
echo "=== Branding applied ==="
echo ""
echo "Next steps:"
echo "  1. Add favicon.ico to src/app/assets/images/"
echo "  2. npm install"
echo "  3. npm run build"
echo "  4. Verify melek.salon and Oracle node IPs in config/default.json"
echo "  5. git add -A && git push origin main"
