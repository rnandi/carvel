#!/bin/bash

if test -z "$BASH_VERSION"; then
  echo "Please run this script using bash, not sh or any other shell." >&2
  exit 1
fi

install() {
	set -euo pipefail

	dst_dir="${K14SIO_INSTALL_BIN_DIR:-/usr/local/bin}"

	echo "Installing ytt..."
	wget -O- https://github.com/k14s/ytt/releases/download/v0.21.0/ytt-linux-amd64 > /tmp/ytt
	echo "88c755c31a4d85d0bdb7a32e7ee34a93c45222a14f4f6204ce65e0da8875452f  /tmp/ytt" | shasum -c -
	mv /tmp/ytt ${dst_dir}/ytt
	chmod +x ${dst_dir}/ytt
	echo "Installed ${dst_dir}/ytt"

	echo "Installing kbld..."
	wget -O- https://github.com/k14s/kbld/releases/download/v0.11.0/kbld-linux-amd64 > /tmp/kbld
	echo "1029110ffa0263fb75a9deb25642f577bb9d5ee25b1a5b10db55310e05388569  /tmp/kbld" | shasum -c -
	mv /tmp/kbld ${dst_dir}/kbld
	chmod +x ${dst_dir}/kbld
	echo "Installed ${dst_dir}/kbld"

	echo "Installing kapp..."
	wget -O- https://github.com/k14s/kapp/releases/download/v0.14.0/kapp-linux-amd64 > /tmp/kapp
	echo "48aff53131654d8ad9adf26febee6104ecc55d89776624e8e57c6dbb33a7edd9  /tmp/kapp" | shasum -c -
	mv /tmp/kapp ${dst_dir}/kapp
	chmod +x ${dst_dir}/kapp
	echo "Installed ${dst_dir}/kapp"

	echo "Installing kwt..."
	wget -O- https://github.com/k14s/kwt/releases/download/v0.0.5/kwt-linux-amd64 > /tmp/kwt
	echo "706abe487e38c4f673180600d11098e408e6bc22fefb1cc512e3ac0f07a9072c  /tmp/kwt" | shasum -c -
	mv /tmp/kwt ${dst_dir}/kwt
	chmod +x ${dst_dir}/kwt
	echo "Installed ${dst_dir}/kwt"
}

install
