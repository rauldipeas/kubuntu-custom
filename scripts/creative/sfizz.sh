#!/bin/bash
set -e
# Sfizz
aria2c --console-log-level=error --summary-interval=0\
	 	"$(wget -qO-\
		'https://software.opensuse.org/download.html?project=home%3Asfztools%3Asfizz&package=sfizz'|\
	 	grep amd64.deb|grep 20.04|cut -d '"' -f2)"
rm -rf sfizz*.metalink
apt install -y ./sfizz*.deb