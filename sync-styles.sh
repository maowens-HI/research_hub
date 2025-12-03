#!/bin/bash
# Helper script to sync styles.css to docs folder
# Run this manually if you suspect styles are broken: ./sync-styles.sh

STYLES_SOURCE="styles.css"
STYLES_DEST="docs/styles.css"

if [ ! -f "$STYLES_SOURCE" ]; then
    echo "❌ Error: $STYLES_SOURCE not found"
    exit 1
fi

echo "📋 Checking styles..."
SOURCE_LINES=$(wc -l < "$STYLES_SOURCE")
DEST_LINES=$(wc -l < "$STYLES_DEST" 2>/dev/null || echo "0")

echo "   Source: $SOURCE_LINES lines"
echo "   Dest:   $DEST_LINES lines"

if [ "$DEST_LINES" -lt 100 ]; then
    echo "🔧 Syncing $STYLES_SOURCE → $STYLES_DEST"
    cp "$STYLES_SOURCE" "$STYLES_DEST"
    echo "✅ Done! Styles synced successfully."
else
    echo "✅ Styles are already in sync."
fi
