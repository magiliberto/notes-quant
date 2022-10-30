#!/bin/bash

# Script to Install
# Linux System Tools,
# Basic Python Packages and
# Jupyter Notebook Server

# GENERAL LINUX
apt-get update # updates the package index cache
apt-get upgrade -y # update packages
apt-get install -y bzip2 gcc git htop screen vim wget tmux # install system tools
apt-get upgrade -y bash #upgrade bash if necesary
apt-get clean # cleans up the pachage index cache

# INSTALL MINICONDA
# downloads Miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O Miniconda.sh
bash Miniconda.sh -b # install it
rm -rf Miniconda.sh # removes the installer
export PATH="/root/miniconda3/bin:$PATH" # prepends the new path
# prepends the new path in the shell configuration
echo "./root/miniconda3/etc/profile.d/conda.sh" >> ~/.bashrc
echo "conda activate" >> ~/.bashrc
echo "conda init py4fi" >> ~/.bashrc

# INSTALL PYTHON LIBRARIES
conda update -y conda # updates conda if required
conda create -y -n py4fi python=3.7 # creates an enviroment
source activate py4fi # activates the new enviroment
conda install -y jupyter
conda install -y pytables
conda install -y pandas
conda install -y matplotlib
conda install -y scikit-learn
conda install -y openpyxl
conda install -y pyyaml

pip install --upgrade pip
pip install cuffliks

# COPING FILES AND CREATING DIRECTORIES
mkdir /root/.jupyter
mv /root/jupyter_notebook_config.py /root/.jupyter
mv /root/cert.* /root/.jupyter
mkdir /root/notebook
cd /root/notebook

# STARTING JUPYTER NOTEBOOK
#jupyter notebook --allow-root

# STARTING JUPYTER NOTEBOOK
# as background process
jupyter notebook --allow-root &
