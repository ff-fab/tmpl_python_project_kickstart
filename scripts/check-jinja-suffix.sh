#!/usr/bin/env bash
# check-jinja-suffix.sh — Catch template files missing the .jinja extension.
#
# Copier only renders file *contents* through Jinja when the filename ends in
# .jinja (the default _templates_suffix). Files without it are copied verbatim,
# so {{ var }} and {% … %} expressions silently survive as literal text.
#
# This script scans template/ for non-.jinja files whose contents contain Jinja
# expressions, and fails if any are found.
#
# Usage:
#   ./scripts/check-jinja-suffix.sh          # scan template/
#   ./scripts/check-jinja-suffix.sh path/dir  # scan a custom directory

set -euo pipefail

TEMPLATE_DIR="${1:-template}"
EXIT_CODE=0
FOUND=0

if [ ! -d "$TEMPLATE_DIR" ]; then
    echo "Directory not found: $TEMPLATE_DIR" >&2
    exit 1
fi

# Find all regular files under template/ that do NOT end in .jinja.
# For each, look for Jinja content expressions:
#   {{ … }}  — variable interpolation
#   {% … %}  — block tags (if/for/macro/etc.)
#
# We use (^|[^$]) to ignore GitHub Actions' ${{ }} syntax, which is
# legitimate literal text in workflow files.
while IFS= read -r -d '' file; do
    # Skip .jinja files (already rendered by Copier)
    [[ "$file" == *.jinja ]] && continue

    # Skip binary files (images, fonts, etc.)
    if file --brief --mime-encoding "$file" 2>/dev/null | grep -q binary; then
        continue
    fi

    # Look for Jinja expressions in file contents
    if grep -nE '(^|[^$])\{\{|(^|[^$])\{%' "$file" > /dev/null 2>&1; then
        if [ "$FOUND" -eq 0 ]; then
            echo "ERROR: Template files with Jinja expressions missing .jinja suffix:"
            echo ""
        fi
        FOUND=$((FOUND + 1))
        echo "  $file"
        grep -nE '(^|[^$])\{\{|(^|[^$])\{%' "$file" | head -5 | sed 's/^/    /'
        echo ""
        EXIT_CODE=1
    fi
done < <(find "$TEMPLATE_DIR" -type f -print0 2>/dev/null)

if [ "$EXIT_CODE" -eq 0 ]; then
    echo "✅ All template files with Jinja expressions have .jinja suffix"
else
    echo "Found $FOUND file(s) with Jinja expressions but no .jinja suffix."
    echo "Copier copies these files verbatim — the expressions won't be rendered."
    echo ""
    echo "Fix: rename each file to add the .jinja suffix, e.g.:"
    echo "  mv template/foo.yml template/foo.yml.jinja"
fi

exit $EXIT_CODE
