FROM ubuntu:trusty
MAINTAINER Tobias Grosser <dockerimage@grosser.es>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install -qy texlive-latex-base \
                        texlive-binaries texlive-latex-extra xindy \
                        texlive-science  texlive-full \
                        texlive-fonts-recommended python-pygments gnuplot

RUN apt-get remove -y texlive-latex-base-doc texlive-latex-recommended-doc \
                     texlive-latex-extra-doc texlive-fonts-recommended-doc \
                     texlive-fonts-extra-doc texlive-humanities-doc \
                     texlive-latex-base-doc texlive-latex-extra-doc \
                     texlive-latex-recommended-doc texlive-metapost-doc \
                     texlive-pictures-doc texlive-pstricks-doc \
                     texlive-publishers-doc texlive-science-doc

RUN apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

WORKDIR /data
VOLUME ["/data"]
