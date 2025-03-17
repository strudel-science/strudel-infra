# strudel-infra

Resources, code, and issues related to the STRUDEL 2i2c hub infrastructure.

## Overview

This repository contains the docker image configuration for the software environment on the STRUDEL 2i2c hub. The hub is a JupyterHub deployment hosted at

- [https://strudel.2i2c.cloud](https://strudel.2i2c.cloud)
- [https://staging.strudel.2i2c.cloud](https://staging.strudel.2i2c.cloud) (staging hub for testing).

Image management follows the guidance at [Update a community-maintained upstream image (recommended) — Hub Service Guide](https://docs.2i2c.org/admin/howto/environment/update-community-image/).

## Configuration

This repository uses [repo2docker](https://repo2docker.readthedocs.io/en/latest/index.html) to version control the [STRUDEL infrastructure image](https://quay.io/repository/strudel/infrastructure-image). The image is configured with the following files:

```bash
.
├── Dockerfile
├── README.md
├── environment.yaml
├── install-vscode-ext.sh
├── start.sh
└── vscode-extensions.txt
```

- `Dockerfile`: The Dockerfile to build the STRUDEL 2i2c hub image.
- `README.md`: This file.
- `environment.yaml`: The conda environment file for the STRUDEL 2i2c hub image.
- `install-vscode-ext.sh`: A script to install VSCode extensions.
- `start.sh`: A script to start the JupyterHub server.
- `vscode-extensions.txt`: A list of VSCode extensions to install.

See [Configuration Files — repo2docker documentation](https://repo2docker.readthedocs.io/en/latest/config_files.html) for reference.

## Usage