# Docker useful commands / files
- each Dockerfile layer results in a bigger size
- remove cache of package manager to save size
- ENTRYPOINT (can't be overwritten) vs. CMD (can be overwritten)
- COPY --chmod=755 to copy while giving permission
- WORKDIR creates a dir (if necessary) and sets it as default dir

## docker
| command    | description |
| :--------- | :---------- |
| docker rm $(docker ps -qa) | removes all containers |
| docker rmi $(docker images -qa) | removes all images |
| docker system prune | clears all unused cache / containers / images |

## docker compose
| command    | description |
| :--------- | :---------- |
| docker compose log | prints container logs |
| docker compose convert (--services) | parses/filters compose file |
| docker compose exec <service_name> /bin/bash/ | start shell for given service container |
