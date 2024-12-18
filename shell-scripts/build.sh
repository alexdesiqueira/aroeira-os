#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


# Install packages

## RPMfusion repos are available by default in ublue main images
## List of rpmfusion packages can be found here:
## https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1
cat /tmp/*.txt | xargs rpm-ostree install

# Enabling system unit files
systemctl enable podman.socket
