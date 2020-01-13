FROM ubuntu:latest

RUN apt update && apt install -yq gcc make git binutils libc6-dev gdb sudo
RUN adduser --disabled-password --gecos '' user
RUN echo 'user ALL=(root) NOPASSWD:ALL' > /etc/sudoers.d/user
RUN mkdir -p /home/user/app

USER user

WORKDIR /home/user/app
