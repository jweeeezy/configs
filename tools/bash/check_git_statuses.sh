#!/bin/bash

GREEN="\033[92m"
RED="\033[91m"
RESET="\033[0m"

check_git_status() {
    local repo_dir="$1"
    local base_dir="$2"
    local rel_path

    if [[ "$repo_dir" == "$base_dir" ]]; then
        rel_path="/"
    else
        rel_path="/${repo_dir#$base_dir/}"
    fi

    if [[ -z $(git -C "$repo_dir" status --porcelain 2>/dev/null) ]]; then
        echo -e "$rel_path: ${GREEN}clean${RESET}"
    else
        echo -e "$rel_path: ${RED}dirty${RESET}"
    fi
}

if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <filepath1> [filepath2 ... filepathN]"
    exit 1
fi

first=1

for root in "$@"; do
    root="${root%/}"

    if [[ ! -d "$root" ]]; then
        echo "Error: '$root' is not a directory."
        continue
    fi

    if [[ $first -eq 0 ]]; then
        echo ""
    fi
    first=0

    echo "$root:"

    if [[ -d "$root/.git" ]]; then
        check_git_status "$root" "$root"
    fi

    find "$root" -mindepth 2 -type d -name ".git" | while read -r gitdir; do
        repo_dir=$(dirname "$gitdir")
        check_git_status "$repo_dir" "$root"
    done
done
