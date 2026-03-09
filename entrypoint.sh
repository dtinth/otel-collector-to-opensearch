#!/bin/sh
set -e
envsubst < /usr/share/data-prepper/pipelines/pipelines.yaml.tmpl \
  > /usr/share/data-prepper/pipelines/pipelines.yaml
exec "$@"
