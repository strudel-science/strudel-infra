FROM quay.io/jupyter/base-notebook:python-3.12

USER ${NB_USER}

COPY environment.yaml /tmp/

RUN mamba env update -p ${CONDA_DIR} -f /tmp/environment.yml && mamba clean -afy

ENV SHELL=/bin/bash
