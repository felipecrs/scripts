#!/usr/bin/env bash

set -euxo pipefail

sudo apt-get update
sudo apt-get install -qq "linux-headers-$(uname -r)"
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"
sudo apt-get install -qq virtualbox-6.1
