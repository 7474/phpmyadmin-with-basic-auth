#!/bin/bash
set -e

printf '%s' "$BACIC_AUTH_PASSWORD" | htpasswd -ci /etc/apache2/.htpasswd "$BACIC_AUTH_USER"

exec /docker-entrypoint.sh "$@"
