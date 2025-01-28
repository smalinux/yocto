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
