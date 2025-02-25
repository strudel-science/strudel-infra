FROM quay.io/jupyter/base-notebook:python-3.12

USER ${NB_USER}

COPY environment.yaml /tmp/
COPY install-vscode-ext.sh /tmp/
COPY vscode-extensions.txt /tmp/

RUN conda env update -p ${CONDA_DIR} -f /tmp/environment.yaml && conda clean -afy

USER root

RUN chmod +x /tmp/install-vscode-ext.sh
RUN source /tmp/install-vscode-ext.sh /tmp/vscode-extensions.txt

USER ${NB_USER}

ENV SHELL=/bin/bash
