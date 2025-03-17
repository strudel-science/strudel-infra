#!/bin/bash

set -euo pipefail

unset VSCODE_PROXY_URI
export VSCODE_PROXY_URI="../proxy/absolute/{{port}}/"

exec "$@"