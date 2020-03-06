#!/bin/sh
set -eou pipefail

logger -sp DEBUG "Install requirements"
pip install -r requirements.txt

logger -sp DEBUG "Run tests"
pytest "${@:-tests}"
