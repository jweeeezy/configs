# -----------------------------------------------------------------------------
# Default Settings
# -----------------------------------------------------------------------------

# shellcheck shell=bash

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# Prompt and Visual
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

# We have color support; assume it's compliant with Ecma-48
# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
# a case would tend to support setf rather than setaf.)
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\
        \[\033[01;32m\]\u@\h\[\033[00m\] | \
        \[\033[01;34m\]\w\[\033[00m\]\n\
        \[\033[01;33m\]$\[\033[00m\] '
        else
            PS1='${debian_chroot:+($debian_chroot)}\
                \u | \w > '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u | \w\a\]$PS1"
        ;;
    *)
        ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    # shellcheck disable=SC2015
    test -r ~/.dircolors && \
        eval "$(dircolors -b ~/.dircolors)" || \
        eval "$(dircolors -b)"
            alias ls='ls --color=auto'
            #alias dir='dir --color=auto'
            #alias vdir='vdir --color=auto'

            alias grep='grep --color=auto'
            alias fgrep='fgrep --color=auto'
            alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# -----------------------------------------------------------------------------
# Personal Settings
# -----------------------------------------------------------------------------

# Variable for different use cases
WORKING_DIRS="$HOME/iss $HOME/private $HOME/configs"

# Function to prepend a directory to PATH if it exists and isn't already in PATH
add_to_path() {
    [ -d "$1" ] || return 0
    case ":$PATH:" in
        *":$1:"*) ;; # already in PATH
        *) PATH="$1:$PATH" ;;
    esac
}

add_to_path "$HOME/.local/bin" # pylsp will be installed here
add_to_path "/usr/local/bin" # cyclonedx-cli will be installed here

export PATH
export PIP_REQUIRE_VIRTUALENV=true

# bash history
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
# append to the history file, don't overwrite it
HISTTIMEFORMAT="%Y-%m-%d %T "
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

alias v="vim"
alias vi="vim"

# Fuzzy Find Setup
export FZF_DEFAULT_OPTS="--walker-skip='.git,*venv,node_modules'"
FZF_DEFAULT_IGNORES=(
    -not -path "*/.git/*"
    -not -path "*/node_modules/*"
    -not -path "*/venv/*"
    -not -path "*/cache/*"
)
export FZF_DEFAULT_COMMAND="find . -type f ${FZF_DEFAULT_IGNORES[*]}"
cdf() {
    local dir
    dir=$(find . -type d "${FZF_DEFAULT_IGNORES[@]}" | fzf) || return
    cd "$dir" || return
}
cdd() {
    local dir
    dir=$(check_git_statuses -d "$WORKING_DIRS" | fzf) || return
    cd "$dir" || return
}
# shellcheck disable=SC1090
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# alias 'Current Working Directory' (cwd)
alias cwd='cd "$CWD"'
alias setcwd='export CWD="$PWD"; echo "$PWD" > ~/.last_dir'
if [ -f ~/.last_dir ]; then
    CWD="$(cat ~/.last_dir)"
    export CWD
fi

# alias 'Current Project Directory' (cpj)
alias cpj='cd "$CPJ"'
alias setcpj='export CPJ="$PWD"; echo "$PWD" > ~/.last_pj'
if [ -f ~/.last_pj ]; then
    CPJ="$(cat ~/.last_pj)"
    export CPJ
fi

# Tab Completion
# If there are multiple matches for completion, Tab should cycle through them
bind 'TAB:menu-complete'
# And Shift-Tab should cycle backwards
bind '"\e[Z": menu-complete-backward'

# Display a list of the matching files
bind "set show-all-if-ambiguous on"

# Perform partial (common) completion on the first Tab press, only start
# cycling full results on the second Tab press (from bash version 5)
bind "set menu-complete-display-prefix on"

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
# shellcheck disable=SC1091
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# shellcheck disable=SC1091
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Run check_git_statuses to get a report of all Git Repositories
echo "Git Repositories Status Report:"
eval check_git_statuses -ct "$WORKING_DIRS" | column -t
echo ""

# Make sure this is after all other prompting changes
eval "$(direnv hook bash)"

# Features:
#
# v = vim
# vi = vim
# cpj = go to current project
# cwd = go to current working dir
# setcpj = set current working project
# setcwd = set current working dir
# cdd = fuzzy find all git repos with git status == 1
# cdf = fuzzy find all important directories
#
# - Pip is protected by virtual environment only
# - Direnv will autoload .envrc files
# - New Bash Instances will display a report of all git repositories (in $WORKING_DIRS)
