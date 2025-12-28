#!/bin/bash
# lint-qmd.sh - Check Quarto files for style compliance
# Based on CLAUDE.md writing style guidelines
# Usage: ./scripts/lint-qmd.sh

set -e

ERRORS=0
WARNINGS=0

echo "========================================"
echo "Research Hub - QMD Linting"
echo "========================================"
echo ""

for file in *.qmd; do
    FILE_ERRORS=0

    # Check for bold formatting in headers/labels (per style guide)
    # Pattern: **Word:** at start of line or after bullet
    if grep -qE '^\*\*[A-Za-z]+:\*\*|^-\s+\*\*[A-Za-z]+:\*\*' "$file"; then
        echo "STYLE: $file - Contains bold labels (use plain text instead)"
        echo "       Example: Use 'Topic:' instead of '**Topic:**'"
        ((FILE_ERRORS++))
    fi

    # Check for images without alt text
    if grep -qE '!\[\]\(' "$file"; then
        echo "A11Y:  $file - Images without alt text"
        ((WARNINGS++))
    fi

    # Check for very long lines (>120 chars) in prose
    if awk 'length > 120 && !/^```/ && !/^\|/' "$file" | grep -q .; then
        echo "WARN:  $file - Contains lines >120 characters"
        ((WARNINGS++))
    fi

    # Check for missing date in frontmatter
    if ! grep -qE '^date:' "$file"; then
        echo "META:  $file - Missing date in frontmatter"
        ((WARNINGS++))
    fi

    # Check for TODO/FIXME comments left in
    if grep -qiE '(TODO|FIXME|XXX|HACK):' "$file"; then
        echo "TODO:  $file - Contains unresolved TODO comments"
        ((WARNINGS++))
    fi

    # Check for double spaces
    if grep -qE '  [a-zA-Z]' "$file"; then
        echo "TYPO:  $file - Contains double spaces"
        ((WARNINGS++))
    fi

    if [ $FILE_ERRORS -gt 0 ]; then
        ((ERRORS+=FILE_ERRORS))
    fi
done

echo ""
echo "========================================"
echo "Summary"
echo "========================================"
echo "Errors:   $ERRORS"
echo "Warnings: $WARNINGS"

if [ $ERRORS -gt 0 ]; then
    echo ""
    echo "Please fix style errors before committing."
    echo "See CLAUDE.md for writing style guidelines."
    exit 1
else
    echo ""
    echo "✓ Style check passed!"
    exit 0
fi
