#!/bin/bash
#
#
# TODO: convert this file to python script!
# Ref: cirosantilli

yes | sudo apt install gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 python3-subunit zstd liblz4-tool file locales libacl1
yes | sudo locale-gen en_US.UTF-8


# Configuring network booting for a development setup
yes | sudo apt-get install tftpd-hpa

# Build the documentation
yes | sudo apt-get install libfreetype6-dev libjpeg8-dev python3-dev python3-pip python3-sphinx texlive-fonts-recommended texlive-latex-extra zlib1g-dev fonts-liberation
yes | sudo apt  install inkscape
yes | sudo apt  install pipx
yes | sudo apt install python3-sphinx-rtd-theme
yes | sudo apt install latexmk


