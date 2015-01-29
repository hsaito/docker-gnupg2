FROM ubuntu:latest
MAINTAINER Hideki Saito <hideki@hidekisaito.com>
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install git curl pkg-config build-essential libncurses5-dev
RUN cd /tmp && git clone https://github.com/hsaito/gnupg-buildkit.git
RUN cd /tmp/gnupg-buildkit && ./updatesig.sh
RUN cd /tmp/gnupg-buildkit && ./get.sh
RUN cd /tmp/gnupg-buildkit && ./build_nox.sh
RUN rm -rf /tmp/gnupg-buildkit
