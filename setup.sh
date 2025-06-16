#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"
cd "$DOTFILES_DIR"

# 1. Create missing directories
echo "Creating missing directories..."
find . -type d ! -path '.' | while read -r dir; do
  target_dir="$HOME/${dir#./}"
  if [ ! -d "$target_dir" ]; then
    echo "  Creating $target_dir"
    mkdir -p "$target_dir"
  fi
done

# 2. Ask to delete or adopt existing config files
echo
echo "Checking for existing config files that would conflict..."
find . -type f | while read -r file; do
  rel_path="${file#./}"
  target="$HOME/$rel_path"
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    echo "Conflict: $target exists and is not a symlink."
    select action in "Delete" "Adopt (move into repo)" "Skip"; do
      case $action in
      Delete)
        rm -rf "$target"
        echo "  Deleted $target"
        break
        ;;
      Adopt*)
        mv "$target" "$file"
        echo "  Adopted $target into repo"
        break
        ;;
      Skip)
        echo "  Skipped $target"
        break
        ;;
      esac
    done
  fi
done

# 3. Call stow to set up all symlinks
echo
echo "Running stow for all packages..."
for pkg in */; do
  stow "$pkg"
done

echo
echo "Dotfiles setup complete."
