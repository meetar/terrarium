#!/bin/bash

os=$(uname)
arq=$(uname -m)

apps_common="tmux mc htop vim zsh wget curl imagemagick "
apps_osx="python opencv"
apps_linux="gdal-bin libgeos++ python-dev python-opencv libjpeg-dev libjpeg8-dev libpng3 libfreetype6-dev python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose" 
python_modules="pil request shapely"

#   Install Applications
#   ===============================================================
if [ $os == "Linux" ]; then

    # on Debian Linux distributions
    sudo apt-get update
    sudo apt-get upgrade

    #  add the PPA to your sources
    sudo add-apt-repository ppa:ubuntugis/ubuntugis-unstable && sudo apt-get update

    # install linux applications
    sudo apt-get install $apps_common
    sudo apt-get install $apps_linux

    # Install Python need files
    if [ ! -e /usr/local/bin/pip ]; then
        wget https://bootstrap.pypa.io/get-pip.py
        sudo python get-pip.py
        rm get-pip.py
    fi

elif [ $os == "Darwin" ]; then
    
    # ON MacOX 
    
    if [ ! -e /usr/local/bin/brew ]; then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    brew update
    brew upgrade
    brew install $apps_common
    brew install $apps_osx
fi

sudo pip install $python_modules
sudo pip install PIL  --allow-unverified PIL --allow-all-external
