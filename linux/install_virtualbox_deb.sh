#!/usr/bin/env bash

set -euxo pipefail

APT_GET="sudo DEBIAN_FRONTEND=noninteractive apt-get"

$APT_GET update
$APT_GET install -qq "linux-headers-$(uname -r)"

## Fetch latest version
BASE_URL="https://download.virtualbox.org/virtualbox"
VERSION="$(wget -q -O- "${BASE_URL}/LATEST.TXT")"

## Install
DEB="$(wget -qO- "${BASE_URL}/${VERSION}" | grep bionic_amd64 | sed -n 's/.*href="\([^"]*\).*/\1/p')"
wget -q "${BASE_URL}/${VERSION}/${DEB}"
$APT_GET install -yq "./$DEB"
rm -f "$DEB"
