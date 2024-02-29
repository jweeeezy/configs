
HOME_DIR  = ~/
FILES     = .vimrc .bashrc
_FILES    = $(addprefix $(HOME_DIR),$(FILES))

HOSTNAME  = $(shell hostname)
USERNAME  = $(shell whoami)
TIMESTAMP = $(shell date)

.PHONY: upload download up dl colors
upload:
	for file in $(_FILES); do cp $$file ./ ; done
	git add $(_FILES)
	git commit -m "$(HOSTNAME) $(USERNAME) $(TIMESTAMP)"
	git push
download:
	git pull
	for file in $(FILES); do cp $$file ~/.; done
up: upload
dl: download
colors:
	cp -r ./vim_colors ~/.vim/colors
