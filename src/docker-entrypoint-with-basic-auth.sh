#!/bin/bash

htpasswd -cb /etc/apache2/.htpasswd "$BACIC_AUTH_USER" "$BACIC_AUTH_PASSWORD"

/docker-entrypoint.sh "$@"
