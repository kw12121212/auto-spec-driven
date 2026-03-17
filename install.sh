#!/usr/bin/env bash
set -euo pipefail

REPO="kw12121212/slim-spec-driven"
BRANCH="main"
SKILLS=(
  spec-driven-propose
  spec-driven-modify
  spec-driven-apply
  spec-driven-verify
  spec-driven-archive
)

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOCAL_SKILLS_DIR="$SCRIPT_DIR/skills"

# Parse flags
PROJECT_DIR=""
i=1
while [ $i -le $# ]; do
  arg="${!i}"
  case "$arg" in
    --project)
      i=$((i + 1))
      # Optional path argument after --project
      if [ $i -le $# ] && [[ "${!i}" != --* ]]; then
        PROJECT_DIR="${!i}"
      else
        PROJECT_DIR="$(pwd)"
      fi
      ;;
  esac
  i=$((i + 1))
done

if [ -n "$PROJECT_DIR" ]; then
  TARGET_DIR="$PROJECT_DIR/.agent/skills"
else
  TARGET_DIR="$HOME/.agents/skills"
fi

echo "Installing skills to: $TARGET_DIR"
mkdir -p "$TARGET_DIR"

installed=0
skipped=0

if [ -d "$LOCAL_SKILLS_DIR" ]; then
  # Running from a local clone — symlink for live updates
  for skill in "${SKILLS[@]}"; do
    filename="${skill}.md"
    skill_file="$LOCAL_SKILLS_DIR/$filename"
    target="$TARGET_DIR/$filename"

    [ -f "$skill_file" ] || { echo "  missing: $filename (skipped)"; skipped=$((skipped + 1)); continue; }

    if [ -L "$target" ]; then
      ln -sf "$skill_file" "$target"
      echo "  updated: $filename"
    elif [ -e "$target" ]; then
      echo "  skipped: $filename (non-symlink file exists)"
      skipped=$((skipped + 1))
      continue
    else
      ln -s "$skill_file" "$target"
      echo "  linked:  $filename"
    fi
    installed=$((installed + 1))
  done
else
  # Running via curl — download files directly
  if ! command -v curl &>/dev/null; then
    echo "Error: curl is required for remote install"
    exit 1
  fi

  BASE_URL="https://raw.githubusercontent.com/$REPO/$BRANCH/skills"

  for skill in "${SKILLS[@]}"; do
    filename="${skill}.md"
    target="$TARGET_DIR/$filename"

    if [ -e "$target" ] && [ ! -L "$target" ]; then
      echo "  skipped: $filename (non-symlink file exists)"
      skipped=$((skipped + 1))
      continue
    fi

    curl -fsSL "$BASE_URL/$filename" -o "$target"
    echo "  fetched: $filename"
    installed=$((installed + 1))
  done
fi

echo ""
echo "Done. $installed skill(s) installed, $skipped skipped."
if [ -n "$PROJECT_DIR" ]; then
  echo "Skills are available project-locally at: $TARGET_DIR"
else
  echo "Skills are available globally at: $TARGET_DIR"
fi
