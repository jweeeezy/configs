
HOME_DIR  = ~/
FILES     = .vimrc .bashrc
_FILES    = $(addprefix $(HOME_DIR),$(FILES))

HOSTNAME  = $(shell hostname)
USERNAME  = $(shell whoami)
TIMESTAMP = $(shell date)

.PHONY: download upload up dl colors
download:
	git pull
	for file in $(FILES); do cp $$file ~/.; done
upload:
	for file in $(_FILES); do cp $$file ./ ; done
	git add $(_FILES)
	git commit -m "$(HOSTNAME) $(USERNAME) $(TIMESTAMP)"
	git push
up: upload
dl: download
colors:
	cp -r ./vim/vim_colors ~/.vim/colors
