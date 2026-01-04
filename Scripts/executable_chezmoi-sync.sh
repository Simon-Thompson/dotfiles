#!/bin/bash
set -euo pipefail

# Write a cron job that looks like this:
# 0 21 */2 * * ~/Scripts/chezmoi-sync.sh
# To run every 2 days at 9 PM

# List of targets to track with chezmoi
TARGETS=(
  ~/.zshrc
  ~/.zshenv
  ~/Scripts
  ~/.config/dunst
  ~/.config/fastfetch
  ~/.config/hypr
  ~/.config/kitty
  ~/.config/quickshell
  ~/.config/nvim
  ~/.config/Thunar
  ~/.config/qBittorrent
  ~/.config/rofi
  ~/.config/waybar
  ~/.config/yazi
  ~/.config/zsh
)

# ChezMoi source directory (default)
CHEZMOI_SRC="$HOME/.local/share/chezmoi"
LOGFILE="$HOME/.chezmoi-sync.log"

# Overwrite log file each run
exec >"$LOGFILE" 2>&1

echo "=== ChezMoi Sync started at $(date) ==="

cd "$CHEZMOI_SRC"

# Step 1: Pull remote changes
echo "Pulling remote changes..."
if ! git pull --rebase; then
  echo "Conflict detected during git pull. Exiting."
  notify-send "ChezMoi Sync" "Conflict detected in dotfiles repo. Manual resolution required."
  exit 1
fi

# Step 2: Add targets
for target in "${TARGETS[@]}"; do
  if [ -e "$target" ]; then
    echo "Adding $target..."
    chezmoi add "$target" --force
  else
    echo "Skipping $target (not found)"
  fi
done

# Step 3: Commit changes if any
if ! git diff --quiet; then
  echo "Committing changes..."
  git add .
  git commit -m "Automated chezmoi sync on $(date '+%Y-%m-%d %H:%M:%S')"
else
  echo "No changes to commit."
fi

# Step 4: Push changes (only if there’s a new commit)
if git log origin/master..HEAD --oneline | grep .; then
  echo "Pushing changes..."
  timeout 120 git push
else
  echo "No new commits to push."
fi

echo "=== ChezMoi Sync finished at $(date) ==="
