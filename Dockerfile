FROM ubuntu:20.04

MAINTAINER Antoni Oliver <aoliverg@uoc.edu>
LABEL description="JoeyNMT"

# Install necessary system packages 
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -yq && apt-get install -yq \
                build-essential \
                git-core \
                wget \
                cmake \
                vim nano unzip gzip python3-pip\
            && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/joeynmt/joeynmt.git
WORKDIR /joeynmt
RUN pip3 install .
RUN pip3 install torchtext==0.10.0
