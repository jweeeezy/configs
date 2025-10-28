#!/usr/bin/env bash

GREEN="\033[92m"
RED="\033[91m"
YELLOW="\033[93m"
RESET="\033[0m"

# Check if a git repository is clean (no changes)
# Return 0 if clean, 1 if dirty
is_clean_git_repo() {
    local repo_dir="$1"
    if [[ -z $(git -C "$repo_dir" status --porcelain 2>/dev/null) ]]; then
        return 0
    else
        return 1
    fi
}

# Check if a git repository has unpushed commits
# Return 0 if yes, return 1 if no
has_unpushed_commits() {
    local repo_dir="$1"

    # Check if branch has upstream
    if ! git -C "$repo_dir" rev-parse --abbrev-ref '@{u}' >/dev/null 2>&1; then
        return 0
    fi

    # Check for commits ahead of upstream
    if [[ -n $(git -C "$repo_dir" log '@{u}'..HEAD --oneline) ]]; then
        return 0
    fi

    return 1
}

# List the given directory if it's a git repo and report its status
# Parameters:
# $1: directory
# $2: show status (1 = show, 0 = hide)
# $3: show only dirty repos (1 = yes, 0 = no)
# $4: use color output (1 = yes, 0 = no)
list_git_repos_with_status() {
    local dir="$1"
    local show_status="$2"
    local show_dirty_only="$3"
    local use_color="$4"

    [[ -d "$dir/.git" ]] || return

    is_clean_git_repo "$dir"
    local is_clean=$?

    has_unpushed_commits "$dir"
    local has_unpushed=$?

    if [[ $is_clean -eq 0 && $has_unpushed -eq 1 ]]; then
        [[ $show_dirty_only -eq 1 ]] && return
        local status="clean"
        local color="${GREEN}"
    elif [[ $has_unpushed -eq 0 ]]; then
        local status="unpushed"; color="${YELLOW}"
    else
        local status="dirty"
        local color="${RED}"
    fi

    if [[ $use_color -eq 1 ]]; then
        if [[ $show_status -eq 1 ]]; then
            echo -e "${dir} ${color}${status}${RESET}"
        else
            echo -e "${color}${dir}${RESET}"
        fi
    else
        if [[ $show_status -eq 1 ]]; then
            echo "$dir $status"
        else
            echo "$dir"
        fi
    fi
}

# Print usage/help message
print_help() {
    cat <<EOF
Usage: $0 [options] <dir1> [dir2 ... dirN]

Recursively scan given directory/ies for Git repositories.

Options:
  -t      Show 'clean', 'dirty' or 'unpushed' git status next to each repo.
  -d      Show only 'dirty' and 'unpushed' repositories (hide clean ones).
  -c      Use colored output (green for clean, red for dirty, yellow for unpushed).
  -h      Show this help message and exit.

Examples:
  $0 -t ~/projects       # Show status for all repos in ~/projects
  $0 -dc ~/code ~/work   # Show only dirty and unpushed repos in color in ~/code and ~/work
EOF
}

# Main function: parse arguments and execute the core logic (see --help message)
main() {
    local FLAG_STATUS=0
    local FLAG_DIRTY_ONLY=0
    local FLAG_COLOR=0

    while getopts "tdch" opt; do
        case $opt in
            t) FLAG_STATUS=1 ;;
            d) FLAG_DIRTY_ONLY=1 ;;
            c) FLAG_COLOR=1 ;;
            h)
                print_help
                exit 0
                ;;
            *)
                print_help
                exit 1
                ;;
        esac
    done
    shift $((OPTIND - 1))

    if [[ $# -eq 0 ]]; then
        echo "Error: No directories provided."
        print_help
        exit 1
    fi

    for root in "$@"; do
        if [[ ! -d "$root" ]]; then
            echo "Error: '$root' is not a directory."
            continue
        fi

        list_git_repos_with_status "$root" \
            $FLAG_STATUS $FLAG_DIRTY_ONLY $FLAG_COLOR

        find "$root" -mindepth 2 -type d -name ".git" 2>/dev/null | \
        while read -r gitdir; do
            repo_dir=$(dirname "$gitdir")
            list_git_repos_with_status "$repo_dir" \
                $FLAG_STATUS $FLAG_DIRTY_ONLY $FLAG_COLOR
        done
    done
}

main "$@"
