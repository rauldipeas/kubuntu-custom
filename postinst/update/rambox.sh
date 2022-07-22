#!/bin/bash
set -e
# Rambox
rm -rf Rambox*.deb
aria2c --console-log-level=error --summary-interval=0\
        "$(wget -qO-\
        https://api.github.com/repos/ramboxapp/download/releases|\
        grep browser_download_url|grep 64.deb|head -n1|cut -d '"' -f4)"
sudo nala install ./Rambox*.deb
rm -rf Rambox*.deb