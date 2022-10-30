#!/bin/bash

# GENERAL LINUX
apt-get update # updates the package index cache
apt-get upgrade -y # update packages
apt-get install -y bzip2 gcc git htop screen vim wget # install system tools
apt-get upgrade -y bash #upgrade bash if necesary
apt-get clean # cleans up the pachage index cache

# INSTALL MINICONDA
# downloads Miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O Miniconda.sh
bash Miniconda.sh -b # install it
rm -rf Miniconda.sh # removes the installer
export PATH="/root/miniconda3/bin:$PATH" # prepends the new path

# INSTALL PYTHON LIBRARIES
conda update -y conda python # updates conda & Python (if required)
conda install -y pandas # installs pandas
conda install -y ipython # installs IPhyton shell
