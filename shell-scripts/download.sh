#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Download packages

wget https://proton.me/download/bridge/protonmail-bridge-3.15.0-1.x86_64.rpm -O /tmp/pm-bridge.rpm
wget https://download.virtualbox.org/virtualbox/7.1.4/VirtualBox-7.1-7.1.4_165100_fedora40-1.x86_64.rpm -O /tmp/vbox.rpm
