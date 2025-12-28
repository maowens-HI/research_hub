#!/bin/bash
# validate-content.sh - Check for broken links and missing images
# Usage: ./scripts/validate-content.sh

set -e

ERRORS=0
WARNINGS=0

echo "========================================"
echo "Research Hub - Content Validation"
echo "========================================"
echo ""

# Check for missing image files
echo "Checking for missing images..."
echo "----------------------------------------"
for qmd in *.qmd; do
    # Extract image paths from markdown syntax: ![alt](path)
    grep -oP '!\[.*?\]\(\K[^)]+' "$qmd" 2>/dev/null | while read -r img; do
        # Skip URLs
        if [[ "$img" =~ ^https?:// ]]; then
            continue
        fi
        # Check if file exists
        if [[ ! -f "$img" ]]; then
            echo "MISSING: $qmd -> $img"
            ((ERRORS++)) || true
        fi
    done
done

if [ $ERRORS -eq 0 ]; then
    echo "✓ All image references are valid"
fi

echo ""

# Check for orphaned images (images not referenced anywhere)
echo "Checking for unused images..."
echo "----------------------------------------"
UNUSED_COUNT=0
for img in images/**/*.png images/**/*.jpg 2>/dev/null; do
    if [[ -f "$img" ]]; then
        basename_img=$(basename "$img")
        if ! grep -rq "$basename_img" *.qmd 2>/dev/null; then
            echo "UNUSED: $img"
            ((UNUSED_COUNT++))
        fi
    fi
done

if [ $UNUSED_COUNT -eq 0 ]; then
    echo "✓ No orphaned images found"
else
    echo "Found $UNUSED_COUNT unused images"
    ((WARNINGS+=UNUSED_COUNT))
fi

echo ""

# Check for broken internal links
echo "Checking internal links..."
echo "----------------------------------------"
LINK_ERRORS=0
for qmd in *.qmd; do
    # Extract links to local .qmd files
    grep -oP '\]\(\K[^)]+\.qmd' "$qmd" 2>/dev/null | while read -r link; do
        if [[ ! -f "$link" ]]; then
            echo "BROKEN LINK: $qmd -> $link"
            ((LINK_ERRORS++)) || true
        fi
    done
done

if [ $LINK_ERRORS -eq 0 ]; then
    echo "✓ All internal links are valid"
fi

echo ""

# Check YAML frontmatter
echo "Checking YAML frontmatter..."
echo "----------------------------------------"
YAML_ERRORS=0
for qmd in *.qmd; do
    if ! head -1 "$qmd" | grep -q '^---$'; then
        echo "MISSING FRONTMATTER: $qmd"
        ((YAML_ERRORS++))
    fi
done

if [ $YAML_ERRORS -eq 0 ]; then
    echo "✓ All files have YAML frontmatter"
fi

echo ""

# Summary
echo "========================================"
echo "Summary"
echo "========================================"
echo "Errors:   $ERRORS"
echo "Warnings: $WARNINGS"

if [ $ERRORS -gt 0 ]; then
    echo ""
    echo "Please fix errors before committing."
    exit 1
else
    echo ""
    echo "✓ Validation passed!"
    exit 0
fi
