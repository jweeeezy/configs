#/ ========================================================================== //

# General
.PHONY: 	all daemon stop build run

all: 		daemon build run
daemon:
				docker info || (open -a Docker && sleep 20)
stop:
				docker stop container_name
build:
				docker build . -t image_name
run:
				docker run -it --name container_name image_name
re:
				$(MAKE) stop ; $(MAKE) rm ; $(MAKE) build

# Clean up
.PHONY:		clean fclean rm rm_ps rm_images

clean: 		rm_container
fclean:		rm_all_container rm_all_images
rm:			rm_ps rm_image
rm_all_container:
				docker rm $(docker ps -qa)
rm_container:
				docker rm container_name
rm_image:
				docker rmi image_name
rm_all_images:
				docker rmi $(docker images -q)

#/ -------------------------------------------------------------------------- //
