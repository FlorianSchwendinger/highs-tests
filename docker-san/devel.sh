#!/bin/bash

cd $HOME
ls

apt-get update
apt install git
apt install zlib1g-dev

git clone --branch latest https://github.com/ERGO-Code/HiGHS.git
git clone --branch main https://github.com/FlorianSchwendinger/highs-tests.git

mkdir -p $HOME/HiGHS/build
cd $HOME/HiGHS/build

cd 
cmake .. -DCMAKE_INSTALL_PREFIX="$HOME/highslib" -DCMAKE_VERBOSE_MAKEFILE:bool=ON -G "Unix Makefiles"
make install
