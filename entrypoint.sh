#!/usr/bin/env bash

set -euo pipefail

# Run supervisord
exec /usr/bin/supervisord -n -c /etc/supervisord.conf
