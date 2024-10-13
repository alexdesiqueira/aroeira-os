#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# Installing packages from Fedora repos
grep -v '^#' /tmp/extra-packages | xargs rpm-ostree install

# Removing packages from image
#grep -v '^#' /tmp/remove-packages | xargs rpm-ostree uninstall

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File
systemctl enable docker.socket
systemctl enable podman.socket
