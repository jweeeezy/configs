#!/usr/bin/env bash

GREEN="\033[92m"
RED="\033[91m"
YELLOW="\033[93m"
RESET="\033[0m"

# Returns:
#   0 = clean (no staged/unstaged changes, no commits ahead of upstream)
#   1 = unpushed commits (HEAD is ahead of its upstream)
#   2 = dirty working tree; DIRTY_TYPE is set to: unstaged | staged | both
#   3 = no upstream branch configured
git_local_status() {
    local repo_dir="$1"
    DIRTY_TYPE=""
    local unstaged=0
    local staged=0
    git -C "$repo_dir" diff --quiet || unstaged=1
    git -C "$repo_dir" diff --cached --quiet || staged=1
    if [[ $unstaged -eq 1 && $staged -eq 1 ]]; then
        DIRTY_TYPE="both"
        return 2
    elif [[ $staged -eq 1 ]]; then
        DIRTY_TYPE="staged"
        return 2
    elif [[ $unstaged -eq 1 ]]; then
        DIRTY_TYPE="unstaged"
        return 2
    fi

    git -C "$repo_dir" rev-parse --abbrev-ref "@{u}" >/dev/null 2>&1 ||
        return 3
    git -C "$repo_dir" rev-list --quiet "@{u}..HEAD"
}

# Returns:
#   0 = update succeeded (remote-tracking branches and tags fetched/pruned)
#   2 = no remotes configured (e.g., 'git remote' returns nothing)
#   3 = update failed (likely authentication or network error during fetch)
git_remote_update() {
    local repo_dir="$1"

    # Avoid interactive prompts in batch/headless runs
    : "${GIT_TERMINAL_PROMPT:=0}"
    : "${GIT_ASKPASS:=/bin/true}"

    if ! git -C "$repo_dir" remote >/dev/null 2>&1 ||
        [[ -z "$(git -C "$repo_dir" remote 2>/dev/null)" ]]; then
        return 2
    fi

    git -C "$repo_dir" fetch --all --prune --tags --quiet 2>&1
    local rc=$?

    if [[ $rc -ne 0 ]]; then
        return 3
    fi
    return 0
}

# Returns:
#   0 = remote is synced (no incoming changes)
#   1 = remote has updates available (unsynced)
#   2 = no upstream branch configured
#   3 = fetch failed, likely due to missing authentication
git_remote_status() {
    local repo_dir="$1"

    git -C "$repo_dir" rev-parse --abbrev-ref "@{u}" >/dev/null 2>&1 ||
        return 2

    # Avoid interactive prompts in headless runs
    : "${GIT_TERMINAL_PROMPT:=0}"
    : "${GIT_ASKPASS:=/bin/true}"

    local output
    output=$(git -C "$repo_dir" fetch --dry-run 2>&1)
    local return_status=$?
    if [[ $return_status -ne 0 ]]; then
        return 3
    fi

    local lines
    lines=$(printf "%s" "$output" | wc -l)

    if [[ $lines -gt 0 ]]; then
        return 1
    fi
    return 0
}

list_git_repos_with_status() {
    local dir="$1"
    local show_status="$2"
    local show_only_dirty="$3"
    local use_color="$4"
    local check_remotes="$5"

    [[ -d "$dir/.git" ]] || return

    local local_status=""
    local local_status_color=""
    git_local_status "$dir"
    local local_check=$?
    case $local_check in
    0)
        local_status="clean"
        local_status_color="${GREEN}"
        ;;
    1)
        local_status="unpushed"
        local_status_color="${YELLOW}"
        ;;
    2)
        local_status="$DIRTY_TYPE"
        local_status_color="${RED}"
        ;;
    3)
        local_status="no-upstream"
        local_status_color="${YELLOW}"
        ;;
    esac

    local remote_status=""
    local remote_status_color=""

    if [[ $check_remotes -eq 1 ]]; then
        git_remote_status "$dir"
        local remote_check=$?
        case $remote_check in
        0)
            remote_status="synced"
            remote_status_color="${GREEN}"
            ;;
        1)
            remote_status="unsynced"
            remote_status_color="${YELLOW}"
            ;;
        2)
            remote_status="no-upstream"
            remote_status_color="${RED}"
            ;;
        3)
            remote_status="unauthenticated"
            remote_status_color="${RED}"
            ;;
        esac

    elif [[ $check_remotes -eq 2 ]]; then
        git_remote_update "$dir"
        local remote_check=$?
        case $remote_check in
        0)
            remote_status="updated"
            remote_status_color="${GREEN}"
            ;;
        2)
            remote_status="no-remotes"
            remote_status_color="${YELLOW}"
            ;;
        3)
            remote_status="update-failed"
            remote_status_color="${RED}"
            ;;
        *)
            remote_status="update-failed"
            remote_status_color="${RED}"
            ;;
        esac
    fi

    if [[ $show_only_dirty -eq 1 ]]; then
        if [[ "$local_status" == "clean" && (-z "$remote_status" || "$remote_status" == "synced") ]]; then
            return
        fi
    fi

    if [[ $use_color -eq 1 ]]; then
        if [[ $show_status -eq 0 ]]; then
            echo -e "${local_status_color}${dir}${RESET}"
        else
            echo -e "${dir} ${local_status_color}${local_status}${RESET} \
                ${remote_status_color}${remote_status}${RESET}"
        fi
    else
        if [[ $show_status -eq 0 ]]; then
            echo "$dir"
        else
            echo "$dir $local_status $remote_status"
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
  -r      Show remote status 'synced', 'unsynced' or 'unauthenticated' (needs git authentication).
  -u      Update remote branches and tags (needs git authentication).
  -h      Show this help message and exit.

Examples:
  $0 -t ~/projects       # Show local status for all repos in ~/projects
  $0 -dc ~/code ~/work   # Show only dirty and unpushed repos in color in ~/code and ~/work
EOF
}

# Main function: parse arguments and execute the core logic (see --help message)
main() {
    local FLAG_STATUS=0
    local FLAG_DIRTY_ONLY=0
    local FLAG_COLOR=0
    local FLAG_REMOTES=0

    local BLACKLIST_DIRS=(build .venv node-modules)

    while getopts "tdchru" opt; do
        case $opt in
        t) FLAG_STATUS=1 ;;
        d) FLAG_DIRTY_ONLY=1 ;;
        c) FLAG_COLOR=1 ;;
        r) FLAG_REMOTES=1 ;;
        u) FLAG_REMOTES=2 ;;
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

    # Build the -prune expression for find from BLACKLIST_DIRS.
    # Produces: -name "build" -o -name "_build" -o ... strip the leading -o
    local prune_expr=()
    for bl in "${BLACKLIST_DIRS[@]}"; do
        prune_expr+=(-o -name "$bl")
    done
    prune_expr=("${prune_expr[@]:1}")

    for root in "$@"; do
        if [[ ! -d "$root" ]]; then
            echo "Error: '$root' is not a directory."
            continue
        fi

        # --- Set up environment for this root in a subshell ---
        (
            # check and use .envrc file

            if command -v direnv >/dev/null 2>&1 && [[ -f "$root/.envrc" ]]; then
                eval "$(cd "$root" >/dev/null 2>&1 &&
                    direnv export bash 2>/dev/null)"
            fi

            # make git fail fast if authentication fails
            : "${GIT_TERMINAL_PROMPT:=0}"
            : "${GIT_ASKPASS:=/bin/true}"

            list_git_repos_with_status "$root" \
                "$FLAG_STATUS" "$FLAG_DIRTY_ONLY" "$FLAG_COLOR" "$FLAG_REMOTES"

            find "$root" -mindepth 2 \( -type d -a \( "${prune_expr[@]}" \) -prune \) \
                -o \( -type d -name ".git" -print \) |
                while read -r gitdir; do
                    repo_dir=$(dirname "$gitdir")
                    list_git_repos_with_status "$repo_dir" \
                        "$FLAG_STATUS" \
                        "$FLAG_DIRTY_ONLY" \
                        "$FLAG_COLOR" \
                        "$FLAG_REMOTES"
                done
        )
    done
}

main "$@"
