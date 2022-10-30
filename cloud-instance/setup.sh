#!/bin/bash

# Setting up a DigitalOcean Droplet
# with Basic Python Stack
# and Jupyter Notebook

# IP ADDRESS FROM PARAMETER
MASTER_IP=$1

# COPYNG THE FILES
scp install.sh root@${MASTER_IP}:
scp cert.* jupyter_notebook_config.py root@${MASTER_IP}:

# EXECUTING THE INSTALLATION SCRIPT
ssh root@${MASTER_IP} bash /root/install.sh
