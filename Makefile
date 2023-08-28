# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jwillert@student.42heilbronn.de            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/25 20:06:35 by jwillert          #+#    #+#              #
#    Updated: 2023/08/27 22:12:56 by jwillert         ###   ########           #
#                                                                              #
# **************************************************************************** #

#	Variables
HOME_DIR	=	~/
FILES		=	$(HOME_DIR).zshrc \
				$(HOME_DIR).vimrc \
				$(HOME_DIR).clang-format \
				$(HOME_DIR).bashrc
_FILES		=	.zshrc \
				.vimrc \
				.clang-format \
				.bashrc
HOSTNAME	=	$(shell hostname)
USERNAME	=	$(shell whoami)
TIMESTAMP	=	$(shell date)

#	Targets file transfer
.PHONY: upload download dl up
upload:
				for file in $(FILES); do cp $$file ./ ; done
				git add Makefile
				git add README.md
				git add templates/
				git add $(_FILES)
				git commit -m "$(HOSTNAME) $(USERNAME) $(TIMESTAMP)"
				git push
download:
				git pull
				for file in $(_FILES); do cp $$file ~/; done
dl:				download
up:				upload
