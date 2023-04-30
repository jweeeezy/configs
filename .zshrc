alias norm='norminette'

alias debug_all="export DEBUG_FLAG='-g -DDEBUG=1 -fsanitize=address'"
alias debug_mem="export -g -fsanitize=address"
alias debug_simple="export DEBUG_FLAG='-g -DDEBUG=1'"
alias debug_g="export DEBUG_FLAG='-g'"
alias debug_off="export DEBUG_FLAG="
alias debug="echo current: '<'$DEBUG_FLAG'>'; cat ~/.zshrc | grep DEBUG_FLAG"

alias francinette=/Users/jwillert/francinette/tester.sh
alias paco=/Users/jwillert/francinette/tester.sh
alias 42dir="cd ~/Documents/42Projects/"
alias Sidedir="cd ~/Documents/SideProjects/"
alias 42tool="cd ~/Documents/_42toolbox/"
alias setcwd='export CWD="$PWD"'
alias cwd='cd "$CWD"'
export PATH=$HOME/goinfre/.brew/bin:$PATH
export USER='jwillert'
export MAIL='@student.42heilbronn.de'
42dir

alias mstest="bash /Users/jwillert/42_minishell_tester/tester.sh"

