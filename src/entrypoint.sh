#!/bin/sh
# TOS wrapper: the LinuxServer image starts s6 as root (chown + su-exec to abc),
# which a non-root container cannot do. Run the unmodified Prowlarr binary
# directly as uid 1000 with a writable /config.
set -u
set -e
mkdir -p /config
cd /app/prowlarr/bin
exec ./Prowlarr -nobrowser -data=/config
