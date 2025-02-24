FROM quay.io/jupyter/docker-stacks-foundation:python-3.12

USER root

RUN apt-get update && apt-get install -y \
    nodejs \
    npm

USER ${NB_USER}
WORKDIR /home/rstudio
ENV SHELL=/bin/bash