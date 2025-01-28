#!/bin/bash

# TFTP
sudo systemctl restart tftpd-hpa

# DNS
sudo systemctl restart isc-dhcp-server

