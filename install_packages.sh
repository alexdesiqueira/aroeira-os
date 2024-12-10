#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Installing packages from Fedora repos
grep -v '^#' /tmp/emacs-ide.txt | xargs rpm-ostree install
