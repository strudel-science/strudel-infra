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

- `Dockerfile`: The Dockerfile to build a JupyterHub compatible STRUDEL 2i2c hub image.
- `README.md`: This file.
- `environment.yaml`: The conda environment file for the STRUDEL 2i2c hub image.
- `install-vscode-ext.sh`: A script to install VSCode extensions.
- `start.sh`: A script to run as an [ENTRYPOINT](https://docs.docker.com/engine/reference/builder/#entrypoint) to the container.
- `vscode-extensions.txt`: A list of VSCode extensions to install.

See [Configuration Files — repo2docker documentation](https://repo2docker.readthedocs.io/en/latest/config_files.html) for reference.

## Usage

### nbgitpuller

We can use [nbgitpuller](https://nbgitpuller.readthedocs.io/en/latest/) to create a URL that we can provide to the end-user which syncs the contents of the [strudel-science/strudel-kit](https://github.com/strudel-science/strudel-kit) GitHub repository to the STRUDEL 2i2c hub.

We pull the `workshop-hub` branch that sets the base URL in a  `.env.local` file by setting the environment variable `VITE_BASE_URL` to the JupyterHub service prefix

```bash
VITE_BASE_URL=${JUPYTERHUB_SERVICE_PREFIX}proxy/absolute/5175/
```

and allows the domain host "strudel.2i2c.cloud" by setting `server.allowedHosts` in `vite.config.js.`

```javascript
server: {
    allowedHosts: ['.strudel.2i2c.cloud'],
}
```

- [nbgitpuller link](https://strudel.2i2c.cloud/hub/user-redirect/git-pull?repo=https%3A%2F%2Fgithub.com%2Fstrudel-science%2Fstrudel-kit&urlpath=vscode%2F%3Ffolder%3D%2Fhome%2Fjovyan%2Fstrudel-kit&branch=workshop-hub)

The nbgitpuller link above is generated with the following parameters in the [nbgitpuller link generator](https://nbgitpuller.readthedocs.io/en/latest/link.html):

- JupyterHub URL: `https://strudel.2i2c.cloud`
- Git Repository URL: `https://github.com/strudel-science/strudel-kit`
- Branch: `workshop-hub`
- Application to open: Custom URL: `vscode/?folder=/home/jovyan/strudel-kit`.

### VSCode

In the VSCode IDE, we can open a new terminal by clicking the ☰ icon in the top left corner and selecting `Terminal > New Terminal`.

Following the instructions in the [strudel-kit README](https://github.com/strudel-science/strudel-kit/blob/main/README.md)

```bash
npm install
```

to install the strudel-kit dependencies.

```bash
npm start
```

to start the development server on the STRUDEL 2i2c hub. Follow the port forwarding to [`https://strudel.2i2c.cloud/user/<your-username>/proxy/absolute/5175/`](https://strudel.2i2c.cloud/user-redirect/proxy/absolute/5175/) to view the app in another browser window.

### Server culling

Sessions on the workshop hub are culled after a 1 hour period of inactivity, and your work is not saved to a persistent storage disk. Please version control and push your code to GitHub for any work you would like to save for the future.

### Stop your server

Running a server consumes resources and costs money. When you are done with your server, please stop it by clicking the `Stop My Server` button in the JupyterHub control panel at

- [https://strudel.2i2c.cloud/hub/home](https://strudel.2i2c.cloud/hub/home).
