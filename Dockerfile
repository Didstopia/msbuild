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
    nuget \
    python-pip \
    git-core

# Install Mono
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb http://download.mono-project.com/repo/debian wheezy main" | tee /etc/apt/sources.list.d/mono-xamarin.list
RUN apt-get update && apt-get install -y mono-complete

# Create a symbolic link for msbuild.exe
RUN ln -s /usr/bin/xbuild /usr/bin/msbuild.exe

# Cleanup
ENV DEBIAN_FRONTEND newt
