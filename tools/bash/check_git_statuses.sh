#!/bin/bash

GREEN="\033[92m"
RED="\033[91m"
RESET="\033[0m"

check_git_status() {
    local repo_dir="$1"
    local base_dir="$2"

    if [[ -z $(git -C "$repo_dir" status --porcelain 2>/dev/null) ]]; then
        echo -e "$repo_dir ${GREEN}clean${RESET}"
    else
        echo -e "$repo_dir ${RED}dirty${RESET}"
    fi
}

if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <filepath1> [filepath2 ... filepathN]"
    exit 1
fi

for root in "$@"; do

    echo

    if [[ ! -d "$root" ]]; then
        echo "Error: '$root' is not a directory."
        continue
    fi

    # Print the root directory status on the same line
    if [[ -d "$root/.git" ]]; then
        check_git_status "$root" "$root"
    else
        echo -e "$root" "-"
    fi

    find "$root" -mindepth 2 -type d -name ".git" | while read -r gitdir; do
        repo_dir=$(dirname "$gitdir")
        check_git_status "$repo_dir" "$root"
    done

done

    echo
