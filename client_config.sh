#!/bin/bash
sudo apt-get update
sudo dpkg -i google-chrome*.deb; sudo apt-get -f install -y && sudo dpkg -i google-chrome*.deb
sudo apt-get install -y xvfb libnss3-tools

certutil -d sql:$HOME/.pki/nssdb -A -t "C,," -n "webrtc" -i cert.crt

