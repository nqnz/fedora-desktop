#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y tmux mpv wl-clipboard wireguard-tools tailscale stress-ng python3-pip samba restic rclone nerd-fonts gcc 

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

# Setup remote if not already present
#flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install all listed flatpaks
#xargs -a /ctx/repo_files/flatpak flatpak install -y --noninteractive


# Brew programs

#xargs brew install < /ctx/repo_files/brew


#### Example for enabling a System Unit File
systemctl enable podman.socket
systemctl enable tailscaled.service
systemctl --global enable podman-auto-update.timer
