#!/bin/bash
# Nightly backup of a config folder into a dated tar.gz.
# Edit SRC and DEST, then: chmod +x backup-config.sh
set -eu

SRC="/etc/myapp"
DEST="/var/backups/myapp"
KEEP_DAYS=14

mkdir -p "$DEST"

# tar: c = create, z = compress, f = next argument is the file name
tar -czf "$DEST/config-$(date +%F).tar.gz" "$SRC"

# delete backups older than KEEP_DAYS so the disk does not fill up
find "$DEST" -name 'config-*.tar.gz' -mtime +"$KEEP_DAYS" -delete
