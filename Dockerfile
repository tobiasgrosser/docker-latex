FROM ubuntu:15.04
MAINTAINER Tobias Grosser <dockerimage@grosser.es>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -qy install --no-install-recommends texlive-latex-base \
     texlive-binaries texlive-science texlive-latex-extra \
     texlive-fonts-recommended ninja-build make

RUN apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

WORKDIR /data
VOLUME ["/data"]
