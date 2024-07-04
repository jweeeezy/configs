#/ -------------------------------------------------------------------------- //

NAME      = program
SRC_FILES = main.c
OBJ_FILES = $(SRC_FILES:.cpp=.o)
CC        = gcc
DEBUG_FLAG= $(shell echo $$DEBUG_FLAG)
CFLAGS    = -Wall -Wextra -Werror $(DEBUG_FLAG)

.PHONY:     all clean fclean re

all:        $(NAME)
$(NAME):    $(OBJ_FILES)
				$(CC) $(CFLAGS) $(OBJ_FILES) -o $(NAME)
%.o:        %.c
				$(CC) $(CFLAGS) -c $< -o $@
clean:
				rm -rf $(OBJ_FILES)
fclean:     clean
				rm -rf $(NAME)
re:         fclean
				$(MAKE)

#/ -------------------------------------------------------------------------- //
