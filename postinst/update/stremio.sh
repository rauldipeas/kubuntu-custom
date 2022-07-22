#!/bin/bash
set -e
# Stremio
rm -rf\
	libfdk-aac1*.deb\
	stremio*.deb
aria2c --console-log-level=error --summary-interval=0\
	http://ftp.debian.org/debian/pool/non-free/f/fdk-aac/\
"$(wget -qO-\
	http://ftp.debian.org/debian/pool/non-free/f/fdk-aac/|\
	grep libfdk-aac1|grep amd64.deb|head -n2|tail -n1|cut -d '"' -f8)"
aria2c --console-log-level=error --summary-interval=0\
	"$(wget -qO-\
	https://www.stremio.com/downloads|\
	grep amd64.deb|cut -d '"' -f222)"
sudo nala install\
	--no-install-recommends\
	./libfdk-aac1*.deb\
	./stremio*.deb\
	youtube-dl
rm -rf\
	libfdk-aac1*.deb\
	stremio*.deb