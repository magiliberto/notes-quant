# Building a Docker Image with
# the Latest Ubuntu Version and
# Basic Python Install

# latest Ubuntu version
FROM ubuntu:latest

# information about maintainer
MAINTAINER yves

# add the bash script
ADD install.sh /

# change rights for the script
RUN chmod u+x /install.sh

# run the bash script
RUN /install.sh

# prepend the new path
ENV PATH /root/miniconda3/bin:$PATH

# exexute IPython whe container is run
CMD ipython
