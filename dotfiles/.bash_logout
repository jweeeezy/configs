
WORKING_DIRS="$HOME/iss $HOME/private $HOME/configs"

if [[ -z "${SKIP_CHECK_GIT_STATUSES:-}" ]]; then
    echo "Git Repositories Status Report:"
    eval check_git_statuses -ct "$WORKING_DIRS" | column -t
    echo ""
    echo "Exiting in 5 Seconds... Press Ctrl-C to cancel"
    sleep 5
fi

if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
    exit 0
fi
