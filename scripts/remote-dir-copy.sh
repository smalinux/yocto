#!/bin/bash

# =======================================
# Simple, generic script to copy complete dir over SSH using SCP
#
# Usage: ./copy-remote-dir.sh <REMOTE_IP> <REMOTE_DIR> <LOCAL_DEST_DIR>
#
# Example:
# ./scripts/remote-dir-copy.sh 192.168.0.251 /sys/kernel/debug/pinctrl/ docs/pinctrl/
# =======================================

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <REMOTE_IP> <REMOTE_DIR> <LOCAL_DEST_DIR>"
    exit 1
fi

REMOTE_IP="$1"
REMOTE_DIR="$2"
LOCAL_DEST="$3"
USER="root"

echo "🔗 Copying from $REMOTE_IP:$REMOTE_DIR to $LOCAL_DEST"

# Create local destination directory if it doesn't exist
mkdir -p "$LOCAL_DEST"

# Use SCP to copy files from remote to local
scp -r ${USER}@${REMOTE_IP}:"$REMOTE_DIR" "$LOCAL_DEST"

echo "✅ Done! Files copied to: $LOCAL_DEST"

