#!/bin/bash
# new-meeting.sh - Create a new meeting notes file with template
# Usage: ./scripts/new-meeting.sh [YYYY-MM-DD]

set -e

# Use provided date or today's date
if [ -n "$1" ]; then
    DATE="$1"
else
    DATE=$(date +%Y-%m-%d)
fi

# Parse date components
YEAR=$(echo "$DATE" | cut -d'-' -f1)
MONTH_NUM=$(echo "$DATE" | cut -d'-' -f2)
DAY=$(echo "$DATE" | cut -d'-' -f3)

# Convert month number to name
case $MONTH_NUM in
    01) MONTH="January" ;;
    02) MONTH="February" ;;
    03) MONTH="March" ;;
    04) MONTH="April" ;;
    05) MONTH="May" ;;
    06) MONTH="June" ;;
    07) MONTH="July" ;;
    08) MONTH="August" ;;
    09) MONTH="September" ;;
    10) MONTH="October" ;;
    11) MONTH="November" ;;
    12) MONTH="December" ;;
esac

# Remove leading zero from day
DAY_NUM=$((10#$DAY))

# Format: meeting-dec-19-2025.qmd (lowercase month abbreviation)
MONTH_ABBREV=$(echo "${MONTH:0:3}" | tr '[:upper:]' '[:lower:]')
FILENAME="meeting-${MONTH_ABBREV}-${DAY_NUM}-${YEAR}.qmd"

# Check if file already exists
if [ -f "$FILENAME" ]; then
    echo "File already exists: $FILENAME"
    echo "Opening existing file..."
else
    # Create the meeting notes file from template
    cat > "$FILENAME" << EOF
---
title: "${MONTH} ${DAY_NUM}, ${YEAR} Meeting"
pagetitle: "${MONTH} ${DAY_NUM}, ${YEAR} Meeting | Research Hub"
date: "${MONTH} ${DAY_NUM}, ${YEAR}"
format:
  html:
    toc: true
    toc-location: left
    toc-depth: 3
---

## Problem

[Describe the issue or question addressed in this meeting]

## Task

> [Quote the specific task or decision from the meeting]

---

## Results

### [Section 1]

::: {layout-ncol="2"}
![Description 1](images/${YEAR}-${MONTH_NUM}-${DAY}/placeholder1.png)

![Description 2](images/${YEAR}-${MONTH_NUM}-${DAY}/placeholder2.png)
:::

---

## Key Takeaways

::: {.callout-note appearance="minimal"}
- [Key finding 1]
- [Key finding 2]
- [Key finding 3]
:::

---

## Next Steps

- [ ] [Action item 1]
- [ ] [Action item 2]

EOF

    echo "Created: $FILENAME"

    # Create images directory for this meeting
    mkdir -p "images/${YEAR}-${MONTH_NUM}-${DAY}"
    echo "Created: images/${YEAR}-${MONTH_NUM}-${DAY}/"
fi

# Try to open in editor
if command -v code &> /dev/null; then
    code "$FILENAME"
elif command -v vim &> /dev/null; then
    vim "$FILENAME"
else
    echo "Open manually: $FILENAME"
fi
