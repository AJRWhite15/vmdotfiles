#!/usr/bin/env bash
# file:   setup.sh
# author: Alistair White
# date:   January 2018
#
# Sets up a Debian VM from scratch.
# Modified from Jesse Robertson

## INSTALL SYSTEM LIBS
# Somewhere to stick local packages
export LOCAL="${HOME}/.local"

# Install packages using apt-get
echo "Installing packages, requires sudo to use apt"
sudo apt-get update
sudo apt-get install vim ruby wget curl
sudo apt install make golang-go

## INSTALL VIM AND BASH CONFIG
# link configs
cp bashrc ~/.bashrc

# Add pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

## INSTALL DOCKER
wget -qO- https://get.docker.com/ | sh

# Add current user to docker group for non-root access
sudo usermod -aG docker $USER

bash ./install_conda.sh
