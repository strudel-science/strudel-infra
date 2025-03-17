#!/bin/bash

set -euo pipefail

export VSCODE_PROXY_URI="../proxy/absolute/{{port}}/"

exec "$@"