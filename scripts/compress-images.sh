#!/bin/bash
# compress-images.sh - Compress PNG images to reduce file size
# Requires: pngquant (install via: brew install pngquant or apt install pngquant)
# Usage: ./scripts/compress-images.sh

set -e

# Check for pngquant
if ! command -v pngquant &> /dev/null; then
    echo "Error: pngquant is not installed"
    echo ""
    echo "Install with:"
    echo "  macOS:  brew install pngquant"
    echo "  Ubuntu: sudo apt install pngquant"
    exit 1
fi

TOTAL_BEFORE=0
TOTAL_AFTER=0
COUNT=0

echo "========================================"
echo "Research Hub - Image Compression"
echo "========================================"
echo ""

# Find PNG files larger than 100KB
find images -name "*.png" -size +100k | while read -r img; do
    BEFORE=$(stat -f%z "$img" 2>/dev/null || stat -c%s "$img")

    # Compress with pngquant
    pngquant --force --quality=65-85 --output "$img" "$img"

    AFTER=$(stat -f%z "$img" 2>/dev/null || stat -c%s "$img")

    # Calculate savings
    SAVED=$((BEFORE - AFTER))
    PERCENT=$((SAVED * 100 / BEFORE))

    echo "Compressed: $img"
    echo "  Before: $(numfmt --to=iec $BEFORE 2>/dev/null || echo "${BEFORE}B")"
    echo "  After:  $(numfmt --to=iec $AFTER 2>/dev/null || echo "${AFTER}B")"
    echo "  Saved:  ${PERCENT}%"
    echo ""

    ((COUNT++)) || true
done

if [ $COUNT -eq 0 ]; then
    echo "No images larger than 100KB found."
    echo "✓ Images are already optimized"
else
    echo "========================================"
    echo "Compressed $COUNT images"
    echo "========================================"
fi
