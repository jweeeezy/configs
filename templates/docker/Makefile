#/ ========================================================================== //

# General
.PHONY: 	all daemon stop build run

all: 		daemon build
daemon:
				docker info || (open -a Docker && sleep 20)
stop:
				docker stop container
build:
				docker build . -t container
run:
				docker run -it container
re:
				$(MAKE) stop ; $(MAKE) rm ; $(MAKE) build

# Clean up
.PHONY:		clean fclean rm rm_ps rm_images

clean: 		rm_ps
fclean:		rm_images
rm:			rm_ps rm_images
rm_ps:
				docker rm container
rm_images:
				docker image rm container

#/ -------------------------------------------------------------------------- //
