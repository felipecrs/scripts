#!/usr/bin/env bash

set -euxo pipefail

VAGRANT_VERSION="$(wget -q -O- https://releases.hashicorp.com/vagrant/ | fgrep 'href="/vagrant' | head -1 | sed -r 's/.*([0-9]+.[0-9]+.[0-9]+).*/\1/')"
wget -q "https://releases.hashicorp.com/vagrant/${VAGRANT_VERSION}/vagrant_${VAGRANT_VERSION}_x86_64.deb"
sudo apt-get install -y "./vagrant_${VAGRANT_VERSION}_x86_64.deb"
rm -f "./vagrant_${VAGRANT_VERSION}_x86_64.deb"
