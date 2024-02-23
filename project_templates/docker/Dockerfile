FROM ubuntu:latest

# Update all ubuntu programs
RUN apt-get update -y && apt-get install -y
RUN apt-get upgrade -y

COPY ./files /usr/src/files
WORKDIR /usr/src/files
