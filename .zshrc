#	Default vim version
alias vim="~/goinfre/.brew/bin/vim"
alias nvim="~/.nvim/bin/nvim"

#	General Workflow
alias  setcwd='echo "$PWD" > ~/.cwd'
alias  cwd='cd "$(cat ~/.cwd)"'
export DATE=$(date +"%m/%d/%Y")

#	Config files
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'

#	Debug compilation helpers
alias debug_all="export DEBUG_FLAG='-g -DDEBUG=1 -fsanitize=address'"
alias debug_mem="export DEBUG_FLAG='-g -fsanitize=address'"
alias debug_simple="export DEBUG_FLAG='-g -DDEBUG=1'"
alias debug_g="export DEBUG_FLAG='-g'"
alias debug_off="export DEBUG_FLAG="
alias debug='echo "CURRENT DEBUG OPTIONS:"; echo [ $DEBUG_FLAG ]; \
	echo ;cat ~/.zshrc | grep DEBUG_FLAG'

#	42 specific
alias norm='norminette'
alias francinette="/Users/jwillert/francinette/tester.sh"
alias paco="/Users/jwillert/francinette/tester.sh"
alias getbrew='rm -rf $HOME/.brew && rm -rf $HOME/goinfre/.brew \
	&& git clone --depth=1 \
	https://github.com/Homebrew/brew $HOME/goinfre/.brew && brew update'
export PATH=$HOME/goinfre/.brew/bin:$PATH
export USER='jwillert'
export MAIL='@student.42heilbronn.de'

#	System specific
alias 42dir="cd ~/Documents/42Projects/"
alias 42tools="cd ~/Documents/_42toolbox/"
alias Sidedir="cd ~/Documents/SideProjects/"
alias config="cd ~/Documents/configs/"
alias cjdir='cd ~/Documents/coding_journal'

alias cje="cjdir && zsh ~/Documents/coding_journal/coding_journal_edit_and_push.sh && cd -"

alias cj="cat ~/Documents/coding_journal/README.md"

alias insert_templ_cpp='cp ~/Documents/configs/templates/cpp/* ./'

#alias cd="printf 🐢; cd"
cwd
