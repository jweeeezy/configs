DIR = ~/configs/docker_setups/vim_ycm/
PWD = $(shell pwd)

BASE_DF = Dockerfile_base
CLANG_DF = Dockerfile_clang

BASE_IMG = vim_ycm_base
CLANG_IMG = vim_ycm_clang

clang: build_clang
	docker run -v $(PWD):/root/code -it $(CLANG_IMG) /bin/bash
build_base:
	sudo docker build -t $(BASE_IMG) -f $(BASE_DF) $(DIR)
build_clang: build_base
	sudo docker build -t $(CLANG_IMG) -f $(CLANG_DF) $(DIR)
