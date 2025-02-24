FROM quay.io/jupyter/base-notebook:python-3.12

USER ${NB_USER}

COPY environment.yaml /tmp/

RUN conda env update -p ${CONDA_DIR} -f /tmp/environment.yaml && conda clean -afy
RUN code-server --install-extension ms-python.python

ENV SHELL=/bin/bash
