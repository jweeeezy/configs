#!/bin/bash

GREEN="\033[92m"
RED="\033[91m"
RESET="\033[0m"

# Checks if a git repository is clean (no changes)
# Returns 0 if clean, 1 if dirty
get_git_status() {
    local repo_dir="$1"
    if [[ -z $(git -C "$repo_dir" status --porcelain 2>/dev/null) ]]; then
        return 0
    else
        return 1
    fi
}

# Lists the given directory if it's a git repo and reports its status
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

    get_git_status "$dir"
    local is_clean=$?

    if [[ $is_clean -eq 0 ]]; then
        [[ $show_dirty_only -eq 1 ]] && return
        local status="clean"
        local color="${GREEN}"
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

# Prints usage/help message
print_help() {
    cat <<EOF
Usage: $0 [options] <dir1> [dir2 ... dirN]

Recursively scans given directories for Git repositories and shows their status.

Options:
  -t      Show 'clean' or 'dirty' status next to each repo.
  -d      Show only dirty repositories (hide clean ones).
  -c      Use colored output (green for clean, red for dirty).
  -h      Show this help message and exit.

Examples:
  $0 -t ~/projects           # Show status for all repos under ~/projects
  $0 -dc ~/code ~/work       # Show only dirty repos in color under both directories
EOF
}

# Main function: parses arguments and executes the core logic (see --help message)
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

        list_git_repos_with_status "$root" $FLAG_STATUS $FLAG_DIRTY_ONLY $FLAG_COLOR

        find "$root" -mindepth 2 -type d -name ".git" 2>/dev/null | while read -r gitdir; do
            repo_dir=$(dirname "$gitdir")
            list_git_repos_with_status "$repo_dir" $FLAG_STATUS $FLAG_DIRTY_ONLY $FLAG_COLOR
        done
    done
}

main "$@"
