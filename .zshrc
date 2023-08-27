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
alias 42tooldir="cd ~/Documents/_42toolbox/"
alias Sidedir="cd ~/Documents/SideProjects/"

alias nvim="~/.nvim/bin/nvim"

alias setcwd='echo "$PWD" > ~/.cwd'
alias cwd='cd "$(cat ~/.cwd)"'

alias cje='echo "\n$DATE\t-\t" >> ~/Documents/coding_journal/README.md; \
	vim -c "normal G$a" ~/Documents/coding_journal/README.md'
alias cj="cat ~/Documents/coding_journal/README.md"

alias getbrew='rm -rf $HOME/.brew && rm -rf $HOME/goinfre/.brew \
	&& git clone --depth=1 \
	https://github.com/Homebrew/brew $HOME/goinfre/.brew && brew update'

export DATE=$(date +"%m/%d/%Y")
export USER='jwillert'
export MAIL='@student.42heilbronn.de'
export PATH=$HOME/goinfre/.brew/bin:$PATH

#alias cd="printf 🐢; cd"
42dir
