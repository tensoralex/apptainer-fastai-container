#!/bin/bash
set -e

mkdir -p ~/apptainer
cd ~/apptainer

lsb_release -a

sudo apt-get install -y  build-essential libseccomp-dev pkg-config squashfs-tools cryptsetup curl wget git

export VERSION=1.18.1 OS=linux ARCH=amd64 && wget https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz && sudo tar -C /usr/local -xzvf go$VERSION.$OS-$ARCH.tar.gz

echo 'export PATH=/usr/local/go/bin:$PATH' >> ~/.bashrc && source ~/.bashrc

export PATH=/usr/local/go/bin:$PATH

go version

rm go$VERSION.$OS-$ARCH.tar.gz 

export VERSION=1.0.1 &&  wget https://github.com/apptainer/apptainer/releases/download/v${VERSION}/apptainer-${VERSION}.tar.gz && tar -xzf apptainer-${VERSION}.tar.gz && cd apptainer-${VERSION}


./mconfig && make -C builddir && sudo make -C builddir install

source ~/.bashrc

apptainer version
