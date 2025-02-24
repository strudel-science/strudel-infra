FROM quay.io/jupyter/base-notebook:python-3.12

USER root

# Use bash for the shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Create a script file sourced by both interactive and non-interactive bash shells
ENV BASH_ENV /home/user/.bash_env
RUN touch "${BASH_ENV}"
RUN echo '. "${BASH_ENV}"' >> ~/.bashrc

# Download and install nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | PROFILE="${BASH_ENV}" bash
RUN echo node > .nvmrc
RUN nvm install

# in lieu of restarting the shell
RUN source ~/.bashrc
    
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
