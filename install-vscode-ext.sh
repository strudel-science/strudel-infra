#!/bin/bash

# Run inside a shell that has the proper environment

# Install VSCode extensions. 
# These get installed to $CONDA_PREFIX/envs/notebook/share/code-server/extensions/

set -eu

xargs -a $1 -I{} code-server --install-extension {}

