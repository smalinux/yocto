#!/bin/bash

# Settings
# --------------
SCRIPTS_DIR=$(realpath "$(dirname "$0")")

# TFTP
sudo ln -sf $SCRIPTS_DIR/../configs/etc/default/tftpd-hpa /etc/default/tftpd-hpa

# DHCP Server
sudo ln -sf $SCRIPTS_DIR/../etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf
sudo ln -sf $SCRIPTS_DIR/../configs/etc/default/isc-dhcp-server /etc/default/isc-dhcp-server

# NFS
sudo ln -sf $SCRIPTS_DIR/../configs/etc/exports /etc/exports

# Rootfs-s
#sudo mount --bind /mnt/_OUTPUT/tmp/deploy/images/ /srv/tftp/

# sudo systemctl daemon-reload
# sudo systemctl enable srv-tftp-mount.service
# sudo systemctl start srv-tftp-mount.service
sudo ln -sf $SCRIPTS_DIR/../configs/etc/systemd/system/srv-tftp-mount.service /etc/systemd/system/srv-tftp-mount.service

