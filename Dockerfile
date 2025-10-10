FROM quay.io/jupyter/base-notebook:python-3.12

USER root
COPY apt.txt /tmp/
RUN apt-get update -qq --yes > /dev/null && \
    xargs apt-get -y install --yes -qq < /tmp/apt.txt

USER ${NB_USER}
COPY environment.yaml /tmp/
RUN conda env update -p ${CONDA_DIR} -f /tmp/environment.yaml && \
    conda clean -afy

ENV SERVICE_URL=https://open-vsx.org/vscode/gallery
COPY install-vscode-ext.sh vscode-extensions.txt /tmp/
RUN /tmp/install-vscode-ext.sh /tmp/vscode-extensions.txt

ENV JUPYTERHUB_HTTP_REFERER="https://strudel.2i2c.cloud/"

COPY start.sh /tmp/
ENTRYPOINT ["/tmp/start.sh"]
