FROM ubuntu:17.10
MAINTAINER Tobias Grosser <dockerimage@grosser.es>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -qy install --no-install-recommends \
     ninja-build make latexmk python-pygments texlive-full asciidoc-base git libxml2-utils


RUN git clone https://gitlab.com/git-latexdiff/git-latexdiff.git
RUN cd git-latexdiff && make install

RUN apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

WORKDIR /data
VOLUME ["/data"]
