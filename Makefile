# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jwillert@student.42heilbronn.de            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/25 20:06:35 by jwillert          #+#    #+#              #
#    Updated: 2023/04/25 20:21:23 by jwillert         ###   ########           #
#                                                                              #
# **************************************************************************** #

#	Variables
HOME_DIR	=	~/
FILES		=	$(HOME_DIR).zshrc\
				$(HOME_DIR).vimrc
_FILES		=	.zshrc\
				.vimrc\
				Makefile
HOSTNAME	=	$(shell hostname)
USERNAME	=	$(shell whoami)
TIMESTAMP	=	$(shell date)

#	Targets
upload:
				for file in $(FILES); do cp $$file ./; done
				git add $(_FILES)
				git commit -m "$(HOSTNAME) $(USERNAME) $(TIMESTAMP)"
			
download:
