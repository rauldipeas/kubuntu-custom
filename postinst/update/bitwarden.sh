#!/bin/bash
set -e
aria2c --console-log-level=error --summary-interval=0\
    'https://vault.bitwarden.com/download/?app=desktop&platform=linux&variant=deb'
sudo apt install -y ./Bitwarden*.deb
rm -rf Bitwarden*.deb