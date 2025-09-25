FROM quay.io/jupyter/base-notebook:python-3.12

USER ${NB_USER}

COPY apt.txt /tmp/
COPY environment.yaml /tmp/
COPY install-vscode-ext.sh /tmp/
COPY vscode-extensions.txt /tmp/
COPY start.sh /tmp/
USER root
RUN chown -R ${NB_USER} /tmp
RUN apt-get update -qq --yes > /dev/null
RUN xargs apt-get -y install --yes -qq < /tmp/apt.txt

USER ${NB_USER}
RUN conda env update -p ${CONDA_DIR} -f /tmp/environment.yaml && conda clean -afy
RUN curl -fsSL https://code-server.dev/install.sh | sh
RUN chmod +x /tmp/install-vscode-ext.sh
RUN chmod +x /tmp/start.sh
RUN source /tmp/install-vscode-ext.sh /tmp/vscode-extensions.txt

ENV SHELL=/bin/bash
ENV JUPYTERHUB_HTTP_REFERER="https://strudel.2i2c.cloud/"

ENTRYPOINT ["/tmp/start.sh"]