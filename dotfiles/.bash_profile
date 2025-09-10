BASHRC_FILEP="$HOME/configs/dotfiles/.bashrc"

if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f $BASHRC_FILEP ]; then
	. $BASHRC_FILEP
    fi
fi
