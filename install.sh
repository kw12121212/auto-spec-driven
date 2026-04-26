#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="$(pwd)"
UNINSTALL=false

for arg in "$@"; do
  case "$arg" in
    --uninstall) UNINSTALL=true ;;
    *) ;;
  esac
done

if $UNINSTALL; then
  echo "Uninstalling skills globally"
  npx skills remove -g
else
  echo "Installing skills globally"
  npx skills add -g "$TARGET_DIR"
fi
