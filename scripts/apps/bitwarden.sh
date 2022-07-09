#!/bin/bash
set -e
#aria2c --console-log-level=error --summary-interval=0\
#    'https://vault.bitwarden.com/download/?app=desktop&platform=linux&variant=deb'
aria2c --console-log-level=error --summary-interval=0\
	"$(wget -qO-\
	https://api.github.com/repos/bitwarden/clients/releases|\
	grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)"
apt install -y ./Bitwarden*.deb