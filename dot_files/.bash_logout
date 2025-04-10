CHECK_GIT_STATUSES_FILEP="$HOME/configs/tools/bash/check_git_statuses.sh"

if [ -f $CHECK_GIT_STATUSES_FILEP ]; then
    $CHECK_GIT_STATUSES_FILEP ~/iss ~/private/ ~/configs/ | column -t
fi

echo "Are you sure you want to exit? Press Ctrl-C to cancel"
sleep 10

if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
    exit 0
fi
