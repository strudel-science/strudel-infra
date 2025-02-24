FROM quay.io/jupyter/base-notebook:python-3.12

USER root

# Download and install nvm:
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

# in lieu of restarting the shell
RUN \. "$HOME/.nvm/nvm.sh"
    
# Download and install Node.js:
RUN nvm install 22

# Verify the Node.js version:
RUN node -v
RUN nvm current 

# Verify npm version:
RUN npm -v

USER ${NB_USER}

# Create strudel-app
RUN pip install strudel-cli
RUN create-app strudel-app
WORKDIR strudel-app

# Install dependencies
RUN npm install

ENV SHELL=/bin/bash
