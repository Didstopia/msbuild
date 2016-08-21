FROM ubuntu:16.04

MAINTAINER didstopia

# Setup the locales
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8 

# Fixes apt-get warnings
ENV DEBIAN_FRONTEND noninteractive

# Run a quick apt-get update/upgrade
RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get autoremove -y

# Install dependencies
RUN apt-get install -y \
    ca-certificates \
    software-properties-common \
    python-software-properties \
    wget \
    mono-complete \
    nuget \
    python-pip \
    git-core

# Create a symbolic link for msbuild.exe
RUN ln -s /usr/bin/xbuild /usr/bin/msbuild.exe

# Cleanup
ENV DEBIAN_FRONTEND newt
