    if [ -d "$HOME/.local/bin" ] ; then
        PATH="$HOME/.local/bin:$PATH"
    fi

    if [ -d "$HOME/bin" ] ; then
        PATH="$HOME/bin:$PATH"
    fi

    . "$HOME/.rye/env"
    
    # newest go version
    export PATH=$PATH:/usr/local/go/bin

    # 42 school MacOs specific
    alias norm='norminette'

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

    # Directories
    alias 42dir="cd ~/42Projects/"
    alias Sidedir="cd ~/SideProjects/"
    alias cjdir='cd ~/coding_journal'
    alias cfg='cd ~/configs'

    # Fuzzy Finder
    export FZF_DEFAULT_OPTS="--walker-skip='.git,*venv,node_modules'"
    export FZF_DEFAULT_IGNORES="-not -path '*/*cache*/*' -not -path '*/\.git/*' -not -path '*/node_modules/*' -not -path '*/*venv/*'"
    export FZF_DEFAULT_COMMAND="find . -type f $FZF_DEFAULT_IGNORES"
    alias fd="cd ~ && cd \$(find * -type d $FZF_DEFAULT_IGNORES | fzf)"
    alias cdf="cd ~ && cd \$(find * -type d $FZF_DEFAULT_IGNORES | fzf)"
    alias cdd="cd ~ && cd \$(find * -type d $FZF_DEFAULT_IGNORES | fzf)"
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash

    # alias 'Current Working Directory' (cwd)
    alias cwd='cd "$CWD"'
    alias setcwd='export CWD="$PWD"; echo "$PWD" > ~/.last_dir'
    if [ -f ~/.last_dir ]; then
        export CWD="$(cat ~/.last_dir)"
    fi

    # alias 'Current Project Directory' (cpj)
    alias cpj='cd "$CPJ"'
    alias setcpj='export CPJ="$PWD"; echo "$PWD" > ~/.last_pj'
    if [ -f ~/.last_pj ]; then
        export CPJ="$(cat ~/.last_pj)"
    fi

    # alias project templates
    alias insert_proj="~/configs/bash_scripts/insert_template_project.sh"

    # alias debug environment variables
    alias debug_a="export DEBUG_FLAG='-g -DDEBUG=1 -fsanitize=address'"
    alias debug_m="export DEBUG_FLAG='-g -fsanitize=address'"
    alias debug_s="export DEBUG_FLAG='-g -DDEBUG=1'"
    alias debug_g="export DEBUG_FLAG='-g'"
    alias debug_d="export DEBUG_FLAG='-DDEBUG=1'"
    alias debug_off="export DEBUG_FLAG="
    alias debug='echo "CURRENT DEBUG OPTIONS:"; echo [ $DEBUG_FLAG ]; \
      echo ;cat ~/.zshrc | grep DEBUG_FLAG'

    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'

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

# ------------------------- premade stuff  --------------------------

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
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] | \[\033[01;34m\]\w\[\033[00m\]\n\[\033[01;33m\]$\[\033[00m\] '
    else
        PS1='${debian_chroot:+($debian_chroot)}\u | \w > '
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
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls --color=auto'
        #alias dir='dir --color=auto'
        #alias vdir='vdir --color=auto'

        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
    fi

    # Add an "alert" alias for long running commands.  Use like so:
    #   sleep 10; alert
    alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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

    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

    # Make sure this is after all other prompting changes
    eval "$(direnv hook bash)"
