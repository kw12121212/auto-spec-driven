#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR=""
UNINSTALL=false

for arg in "$@"; do
  case "$arg" in
    --project)
      shift
      PROJECT_DIR="${1:-$(pwd)}"
      ;;
    --uninstall) UNINSTALL=true ;;
    *) ;;
  esac
done

TARGET_DIR="${PROJECT_DIR:-$(pwd)}"

if $UNINSTALL; then
  echo "Uninstalling skills from: $TARGET_DIR"
  npx skills remove "$TARGET_DIR"
else
  echo "Installing skills to: $TARGET_DIR"
  npx skills add "$TARGET_DIR"
fi
