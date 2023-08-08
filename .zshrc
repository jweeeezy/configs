alias norm='norminette'

alias debug_all="export DEBUG_FLAG='-g -DDEBUG=1 -fsanitize=address'"
alias debug_mem="export DEBUG_FLAG='-g -fsanitize=address'"
alias debug_simple="export DEBUG_FLAG='-g -DDEBUG=1'"
alias debug_g="export DEBUG_FLAG='-g'"
alias debug_off="export DEBUG_FLAG="
alias debug='echo "CURRENT DEBUG OPTIONS:"; echo [ $DEBUG_FLAG ]; \
	echo ;cat ~/.zshrc | grep DEBUG_FLAG'

alias francinette=/Users/jwillert/francinette/tester.sh
alias paco=/Users/jwillert/francinette/tester.sh

alias 42dir="cd ~/Documents/42Projects/"
alias Sidedir="cd ~/Documents/SideProjects/"
alias 42tool="cd ~/Documents/_42toolbox/"

alias mstest="bash /Users/jwillert/42_minishell_tester/tester.sh"

alias setcwd='export CWD="$PWD"'
alias cwd='cd "$CWD"'
alias getbrew='rm -rf $HOME/.brew && rm -rf $HOME/goinfre/.brew \
	&& git clone --depth=1 \
	https://github.com/Homebrew/brew $HOME/goinfre/.brew && brew update'

export USER='jwillert'
export MAIL='@student.42heilbronn.de'
export PATH=$HOME/goinfre/.brew/bin:$PATH

#alias cd="printf 🐢; cd"
42dir
