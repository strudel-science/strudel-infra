FROM quay.io/jupyter/base-notebook:python-3.12

USER root

RUN apt-get update && apt-get install -y \
    nodejs \
    npm

USER ${NB_USER}
ENV SHELL=/bin/bash
