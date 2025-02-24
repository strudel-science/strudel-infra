FROM quay.io/jupyter/base-notebook:python-3.12

USER ${NB_USER}

COPY environment.yaml /tmp/

RUN conda env update -p ${CONDA_DIR} -f /tmp/environment.yaml && conda clean -afy

RUN chmod +x install-vscode-ext.sh && ./install-vscode-ext.sh vscode-extensions.txt

USER ${NB_USER}

ENV SHELL=/bin/bash
