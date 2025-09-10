WORKING_DIRS='$HOME/iss $HOME/private $HOME/configs'

echo "Git Repositories Status Report:"
eval check_git_statuses -ct $WORKING_DIRS | column -t
echo ""

echo "Exiting in 5 Seconds... Press Ctrl-C to cancel"
sleep 5

if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
    exit 0
fi
