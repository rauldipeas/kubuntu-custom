#!/bin/bash
set -e
# Streamon
aria2c --console-log-level=error --summary-interval=0\
	"$(wget -qO-\
	https://api.github.com/repos/haxzie/instagram-live-streamer/releases|\
	grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)"
apt install -y ./instagram-live-streamer*.deb