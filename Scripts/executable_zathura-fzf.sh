#!/bin/bash

PDF=$(
  fd -t f -e pdf --search-path ~/Documents --search-path ~/Downloads 2>/dev/null |
    while IFS= read -r path; do
      file="$(basename "$path")"
      parent="$(basename "$(dirname "$path")")"
      grandparent="$(basename "$(dirname "$(dirname "$path")")")"
      if [ -n "$grandparent" ]; then
        printf '%s/%s/%s\t%s\n' "$grandparent" "$parent" "$file" "$path"
      else
        printf '%s/%s\t%s\n' "$parent" "$file" "$path"
      fi
    done |
    fzf --prompt="Select PDF: " --delimiter=$'\t' --with-nth=1 --nth=1 |
    cut -f2
)

if [[ -n "$PDF" ]]; then
  nohup zathura "$PDF" &
  sleep 0.2
fi

exit 0
