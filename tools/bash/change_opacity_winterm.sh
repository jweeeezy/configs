#!/bin/bash

USERNAME="WILLERTJ"
FILEP="/mnt/c/Users/$USERNAME/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json"
TMPFILE="/tmp/settings.tmp.json"

prompt() {
  if [ $# -lt 1 ]; then
    read -p "New Opacity Value for Windows Terminal (0-100): " VALUE_NEW
  else
    VALUE_NEW=$1
  fi
  if [ "$VALUE_NEW" -gt 100 ]; then VALUE_NEW=100; fi
  if [ "$VALUE_NEW" -lt 0 ]; then VALUE_NEW=1; fi
}

main() {
  prompt "$1"
  jq --argjson newVal "$VALUE_NEW" '
    if .profiles.list then
      .profiles.list |= map(
        if has("opacity") then
          .opacity = $newVal
        else
          .
        end
      )
    else
      .
    end
  ' "$FILEP" > "$TMPFILE" && mv "$TMPFILE" "$FILEP"
  echo "Updated opacity to $VALUE_NEW in all profiles."
}

main "$1"
