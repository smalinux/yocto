#!/bin/bash
#
# Sync contents from host directories to target directories
#
ROOT_DIR="/mnt/_OUTPUT/rootfs/"

echo "$(basename "$0"): rsync ... Start!"
# Unset (open) ownership for all target directories
sudo chown -R "$USER":"$USER" "$ROOT_DIR"*/target/

# Sync host directories to target directories
for dir in "${ROOT_DIR}"*/host/; do
  rsync -a --delete --ignore-times "$dir" "${dir%/host/}/target/"
done

# Re-set (close) ownership for all target directories
sudo chown -R root:root "$ROOT_DIR"*/target/
echo "$(basename "$0" ): rsync ... Done!"

